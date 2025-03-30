# Start a session on an instance by name. Searches within every SSO profile defined in
# ~/.aws/config for the instance name (with a cache for speed).
#
# Usage e.g. `session pub-aws2-ops`
function session
    set instName $argv[1]
    set cacheDir ~/.aws/cdl-inst-cache
    if not type session-manager-plugin > /dev/null
        echo "Error: AWS Session Manager Plugin is not installed. Go here: https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
        return 1
    end

    set chk (egrep -H "$instName" $cacheDir/* /dev/null)
    if test "$chk" = ""
        __build-inst-cache
        set chk (egrep -H "$instName" $cacheDir/* /dev/null)
        if test "$chk" = ""
            echo "Error: instance '$instName' not found." >&2
            return 1
        end
    end

    set params (echo $chk | head -1 | sed 's/ .*/ /' | sed 's/^.*cdl-inst-cache./--profile /' | sed 's/:i-/ --target=i-/')
    set cmd "aws ssm start-session $params"
    echo $cmd >&2
    eval $cmd
    stty sane; tput cnorm  # fix terminal if session times out
end

# Awesome auto-completion for 'session' (thanks Hardy!)
#
# Usage e.g `session pub-TAB`
complete -c session -a "(cut -f2 ~/.aws/cdl-inst-cache/*)"

# Private function used by session() to maintain a cache of profile+instName -> instId
function __build-inst-cache
    set cacheDir ~/.aws/cdl-inst-cache
    echo "Refreshing ec2 instance id cache." >&2
    if not test -f ~/.aws/config
        echo "Error: ~/.aws/config not found" >&2
        return 1
    end

    set profiles (egrep '\[profile' ~/.aws/config | awk '{print $2}' | sed 's/\]//')
    if test "$profiles" = ""
        echo "Error: no profiles found in ~/.aws/config" >&2
        return 1
    end

    mkdir -p $cacheDir; rm -f $cacheDir/*
    set +m  # disable job control messages
    for profile in $profiles
        aws --profile $profile ec2 describe-instances --output text \
            --query 'Reservations[*].Instances[?!contains(State.Name, `terminated`)].[InstanceId, Tags[?Key == `Name`] | [0].Value]' \
            >> $cacheDir/$profile &
    end
    wait
    set -m  # re-enable job control messages
end

function ec2-inst
    set cacheDir ~/.aws/cdl-inst-cache
    set prefix ""
    for instName in $argv
        set chk (egrep -H "$instName" $cacheDir/* ^/dev/null)
        if test "$chk" = ""
            echo "Error: instance '$instName' not found." >&2
            return 1
        end
        set instId (echo $chk | head -1 | sed 's/.*://' | sed 's/ .*/ /')
        echo -n "$prefix$instId"
        set prefix " "
    end
    echo ""
end

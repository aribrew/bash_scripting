#!/bin/bash

message()
{
    MESSAGE="$1"

    if ! [[ "$MESSAGE" == "" ]];
    then
        echo -e "$MESSAGE"
        #yad --info --title "Info" --text "$MESSAGE"
    fi
}


MOONLIGHT_CMDLINE="/tmp/moonlight_cmdline"


if [[ -f "$MOONLIGHT_CMDLINE/cmdline" ]];
then
    CMDLINE=$(cat "$MOONLIGHT_CMDLINE/cmdline")

    if ! [[ "$CMDLINE" == "" ]];
    then
        # Process the command line to get the command
        # executable and the arguments.
        #
        # Also, clean the argument list of trailing spaces
        # while keeping quotes untouched.
        CMD=$(echo "$CMDLINE" | cut -d ' ' -f 1)
        ARGS=$(echo "$CMDLINE" | awk '{$1=""; print $0}')
        ARGS=$(echo "$ARGS" | awk '{$1=$1; print}')
        
        if [[ "$CMD" == "su" ]] || [[ "$CMD" == "sudo" ]];
        then
            message "No 'su' or 'sudo' cmdlines are allowed."
            exit 1
        fi

        MESSAGE="Executing $CMD"

        if ! [[ "$ARGS" == "" ]];
        then
            MESSAGE+=" with args: $ARGS"
        fi

        MESSAGE+=" ...\n"

        message "$MESSAGE"


        if [[ -f "$MOONLIGHT_CMDLINE/env" ]];
        then
            source "$MOONLIGHT_CMDLINE/env"
        fi
                
        "$CMD" "$ARGS"

        if [[ -f "$MOONLIGHT_CMDLINE/env" ]];
        then
            rm "$MOONLIGHT_CMDLINE/env"
        fi

        rm "$MOONLIGHT_CMDLINE/cmdline"
    fi
else
    message "No cmdline to execute found.\n"
fi

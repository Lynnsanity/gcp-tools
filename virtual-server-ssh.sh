#!/bin/bash

echo "Which server would you like to SSH into?"
read _VIRTUAL_SERVER_NAME

if [ -z "$_VIRTUAL_SERVER_NAME" ]; then
    echo "No virtual server name given. Please try running the script again with a valid server name."
else
    echo "You entered ${_VIRTUAL_SERVER_NAME}."
    echo "Getting external IP of virtual server ${_VIRTUAL_SERVER_NAME}..."
    # get the external ip of the virtual server
    _GET_VM_IP=$(gcloud compute instances describe ${_VIRTUAL_SERVER_NAME} \
        --project=<enter-project-name-here> \
        --zone=<enter-zone> \
        --format='get(networkInterfaces[0].accessConfigs[0].natIP)')

        echo "SSHing into ${_VIRTUAL_SERVER_NAME}"
        ssh <enter-username>@${_GET_VM_IP}
fi



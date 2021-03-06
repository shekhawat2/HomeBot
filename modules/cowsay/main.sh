#!/bin/bash
#
# Copyright (C) 2020 SebaUbuntu's HomeBot
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module_cowsay() {
	if [ "$(tg_get_command_arguments "$@")" != "" ]; then
		tg_send_message "$(tg_get_chat_id "$@")" "\`\`\`
$(cowsay "$(tg_get_command_arguments "$@")")
\`\`\`" "$(tg_get_message_id "$@")"
	else
		tg_send_message "$(tg_get_chat_id "$@")" "Error: please write something after the command" "$(tg_get_message_id "$@")"
	fi

}
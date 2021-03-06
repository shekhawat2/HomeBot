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

module_ci() {
	if echo "$(tg_get_sender_id "$@")" | grep -q "$CI_AUTHORIZED_USER_IDS"; then
		modules/ci/build.sh "$@" &
	else
		tg_send_message "$(tg_get_chat_id "$@")" "Error: you are not authorized to use CI function of this bot, ask to who host this bot to add you to the authorized people list" "$(tg_get_message_id "$@")"
	fi
}
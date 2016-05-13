#!/usr/bin/env python3.4
#
#   Copyright 2016 - The Android Open Source Project
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

from vts.runners.host import signals


class BaseTestError(Exception):
    """Raised for exceptions that occured in BaseTestClass."""


class USERError(Exception):
    """Raised when a problem is caused by user mistake, e.g. wrong command,
    misformatted config, test info, wrong test paths etc.
    """

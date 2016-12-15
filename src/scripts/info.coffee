# Description:
#   Test script
#
# Commands:
#   eloyt who are you?
#
# Author:
#   Mahan <eng.mahan.hazrati@gmail.com>

module.exports = (robot) ->

# Test
    robot.respond /who are you?/i, (res) ->
        res.send "`#{res.message.text}`\nHello this is eloyt bot."

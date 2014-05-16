# Description:
#   Responds with James Mickens Markov Chain Generated Sentences
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   Matthew Finlayson <matt@unsure.org> (http://www.jivesoftware.com)

module.exports = (robot) ->
  robot.hear /mickov/i, (msg) ->
    msg.http("http://mickov.herokuapp.com")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          msg.send "#{json.sentence[0]}
        catch error
          msg.send "Something went sideways. I blame Seth."

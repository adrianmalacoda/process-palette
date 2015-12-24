PathPattern = require './path-pattern'

module.exports =
class RegExpPattern

  constructor: (@config) ->
    @regex = new RegExp(@config.pattern, @config.flags);

  match: (text) ->
    m = @regex.exec(text);

    if !m?
      return null;

    try
      match = m[0];
      path = m[@config.path];

      pre = text.substring(0, m.index);
      post = text.substring(m.index+m[0].length);
      line = null;

      if @config.line?
        line = parseInt(m[@config.line]);

      return new PathPattern(text, match, path, line, pre, post);

    return null;

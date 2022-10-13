const { environment } = require("@rails/webpacker")
/* source: https://blog.makersacademy.com/how-to-install-bootstrap-and-jquery-on-rails-6-da6e810c1b87 */
const webpack = require("webpack");
environment.plugins.append("Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    Popper: ["popper.js", "default"],
  })
)

module.exports = environment;

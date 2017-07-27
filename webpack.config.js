var path = require("path");
module.exports = {
  entry: {
    app: ["./app/javascript/packs/index.js"]
  },
  output: {
    path: path.resolve(__dirname, "build"),
    publicPath: "/assets/",
    filename: "bundle.js"
  }
};

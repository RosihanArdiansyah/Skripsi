module.exports = {
  ...otherConfig,
  plugins: [
    new CopyPlugin([{ 
        from: './node_modules/@pdftron/pdfjs-express/public',
        to: './public/docs' 
      }]
    ),
  ],
};
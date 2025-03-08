process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 1;
const fs = require("fs");
const axios = require("axios");

const BASE_URL = "https://qapi.vercel.app/api/random";

const getQuote = async () => {
  try {
    const { data } = await axios.get(BASE_URL);
    const quote = data.quote;
    const author = data.author === null ? `Anonymous` : data.author;

    console.log("New quote", `"${quote}"`);
    console.log("Author", `"${author}"`);

    return {
      quote,
      author,
    };
  } catch (err) {
    console.error(err.message);
    return {};
  }
};

const getDate = () => {
  const curDate = new Date();
  const dd = String(curDate.getDate()).padStart(2, `0`);
  const mm = String(curDate.getMonth() + 1).padStart(2, `0`);
  const yyyy = String(curDate.getFullYear()).padStart(4, `0`);
  return `${mm}/${dd}/${yyyy}`;
};

const generate = async () => {
  const { quote, author } = await getQuote();
  const today = getDate();

  let readmeContent = fs.readFileSync("Private/temp.md", "utf-8");
  readmeContent = readmeContent.replace(/{{DATE}}/g, today);
  readmeContent = readmeContent.replace(/{{QUOTE}}/g, quote);
  readmeContent = readmeContent.replace(/{{AUTHOR}}/g, author);
  fs.writeFileSync("README.md", readmeContent);
};

generate();

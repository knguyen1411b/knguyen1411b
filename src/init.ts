process.env.NODE_TLS_REJECT_UNAUTHORIZED = "1";

import axios from "axios";
import fs from "fs";

const BASE_URL = "https://zenquotes.io/api/random";

type QuoteApiItem = {
  q: string;
  a: string | null;
};

type QuoteResult = {
  quote: string;
  author: string;
};

const getDateInUtc7 = (): string => {
  return new Intl.DateTimeFormat("vi-VN", {
    timeZone: "Asia/Ho_Chi_Minh",
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
  }).format(new Date());
};

const getQuote = async (): Promise<QuoteResult> => {
  try {
    const { data } = await axios.get<QuoteApiItem[]>(BASE_URL, {
      timeout: 10000,
    });

    return {
      quote: data[0]?.q ?? "Build simple solutions first.",
      author: data[0]?.a ?? "Khánh Nguyên",
    };
  } catch (err) {
    console.error(err instanceof Error ? err.message : "Unknown error");

    return {
      quote: "Build simple solutions first. Scale only when necessary.",
      author: "Khánh Nguyên",
    };
  }
};

const generate = async (): Promise<void> => {
  const { quote, author } = await getQuote();
  const updatedAt = getDateInUtc7();

  let readmeContent = fs.readFileSync("src/template.md", "utf-8");

  readmeContent = readmeContent
    .replace(/{{DATE}}/g, updatedAt)
    .replace(/{{QUOTE}}/g, quote)
    .replace(/{{AUTHOR}}/g, author)
    .replace(/{{UPDATED_AT}}/g, updatedAt);

  fs.writeFileSync("README.md", readmeContent);

  console.log("README.md has been updated successfully.");
};

generate();

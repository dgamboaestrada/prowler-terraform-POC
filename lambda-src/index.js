"use strict";
exports.handler = async (event) => {
  let access_key = "AKXXXXXXXX";
  let secret_key = "XXXXXXXXXX";
  const response = {
    statusCode: 200,
    body: event,
  };
  return response;
};

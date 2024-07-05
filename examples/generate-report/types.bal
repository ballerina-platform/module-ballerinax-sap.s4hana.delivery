type S4HANAClientConfig record{
  string hostname;
  string username;
  string password;
};

type GmailClientConfig record{
  string refreshToken;
  string clientId;
  string clientSecret;
  string recipientAddress;
  string fromAddress;
};
export type Account = {
    get(k:ACCOUNT_KEY) : any;
    
};

export type ACCOUNT_KEY = 
"display_name" | "username" | "acct" | "suspended" | "id" | any;
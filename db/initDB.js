db.createUser({
    user: "gjdeveloper",
    pwd: "1234qwer!",
    roles: [
        {
            role: "readWrite",
            db: "jlog",
        },
    ],
});

db.users.insert({
    _id: "default",
    pw: "1234",
    nickname: "기본유저",
    notion: "Jlog-Blog-92e232f59dfb490daff71aca853d8311",
    createdDatetime: new Date(),
});

db.posts.insert({
    userId: "default",
    title: "환영합니다",
    content: "Jlog에 오신것을 환영합니다.",
    createdDatetime: new Date(),
    modifiedDatetime: new Date(),
});

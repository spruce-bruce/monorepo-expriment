'use strict';

const Hapi = require('@hapi/hapi');
const shared = require('shared');

const init = async () => {

    const server = Hapi.server({
        port: 9000,
        host: 'localhost'
    });

    await server.start();
    console.log('Server running on %s', server.info.uri);
    console.log({shared});
};

process.on('unhandledRejection', (err) => {

    console.log(err);
    process.exit(1);
});

init();

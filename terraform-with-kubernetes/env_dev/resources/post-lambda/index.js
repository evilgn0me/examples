'use strict';

const
    AWS = require( 'aws-sdk' ),
    S3  = new AWS.S3();

exports.handler = ( event, context, callback ) => {
    console.log( `FUNCTION STARTED: ${new Date()}` );
    console.info('Received event', event);
    var body = JSON.stringify(event)

    S3.putObject( {
         Bucket: 'test-lambda-poster-dev',
         Key: Date(),
         Body: body,
         ContentType: 'text/plain'
    } )
         .promise()
         .then( () => console.log( 'UPLOAD SUCCESS' ) )
         .then( () => callback( null, 'MISSION SUCCESS' ) )
         .catch( e => {
            console.error( 'ERROR', e );
            callback( e );
         } );
};
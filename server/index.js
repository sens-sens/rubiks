const http = require('http');
const mysql = require('mysql2');

const connection = mysql.createConnection({
    host:'localhost',
    user:'username',
    password:'password',
    database:'products',
});

const server = http.createServer((req,res)=>{

    res.setHeader('Access-Control-Allow-Origin','*');
    res.setHeader('Access-Control-Allow-Methods','GET');
    res.setHeader('Access-Control-Allow-Headers','Content-Type');

    if (req.url =='/api/products' && req.method==='GET') {

        const query = `SELECT p.id, p.product_name, p.price, p.product_type, p.description, JSON_ARRAYAGG(i.image_link) AS image_urls
        FROM products.product_info p
        LEFT JOIN products.product_images i ON p.id = i.product_id
        GROUP BY p.id, p.product_name, p.price,p.product_type, p.description`;

        connection.query(query,(error,results)=>{
            if(error){
                console.error('Error fetching product details:', error);
                res.writeHead(500, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ error: 'Error fetching product details' }));
                return;
        
            }
            const products = results.map((row) => {
                const { id, product_name, price, product_type,description, image_urls } = row;
                const images = image_urls?image_urls : [];
                return { id, product_name, price, product_type, description, images };
              });
        
              res.writeHead(200, { 'Content-Type': 'application/json' });
              res.end(JSON.stringify(products));
            });
          } else {
            res.writeHead(404, { 'Content-Type': 'application/json' });
            res.end(JSON.stringify({ error: 'Not found' }));
          }
        });

        server.listen(3000,()=>{
            console.log('Server is running on port 3000');
        })
var database = require("../database/config")

function listar() {
    console.log("ACESSEI O GATO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `

    select * from usuario join gato on gato.fk_cadastrado = usuario.email;
    
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// function entrar(email, senha) {
//     console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
//     var instrucao = `
//         SELECT * FROM usuario WHERE email = '${email}' AND senha = '${senha}';
//     `;
//     console.log("Executando a instrução SQL: \n" + instrucao);
//     return database.executar(instrucao);
// }

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrarGato(nomeGato, sexo, idade, porte, vacina, castrado, pelagem, tamanho, peso, historia, link, fotos, confirmarEmail) {
    console.log("ACESSEI O GATO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrarGato():", nomeGato, sexo, idade, porte, vacina, castrado, pelagem, tamanho, peso, historia, link, fotos, confirmarEmail);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
    INSERT INTO gato (nomeGato, sexo, idade, porte, vacina, castrado, pelagem, tamanho, peso, historia, linkFotos, fotos, fk_cadastrado) VALUES ('${nomeGato}', '${sexo}', '${idade}', '${porte}','${vacina}', '${castrado}', '${pelagem}', ${tamanho}, ${peso}, '${historia}', '${link}','${fotos}','${confirmarEmail}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function testar() {
    console.log("Rodou a função");
}

module.exports = {
    cadastrarGato,
    listar,
    testar
};
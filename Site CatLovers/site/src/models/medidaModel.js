var database = require("../database/config");

function buscarUltimasMedidas(idPergunta, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select
        (SELECT COUNT(descricao) FROM respostas WHERE descricao = 'sim' AND fkPergunta = ${idPergunta}) AS Sim,
        (SELECT COUNT(descricao) FROM respostas WHERE descricao = 'nao' AND fkPergunta = ${idPergunta}) AS Nao
      FROM respostas;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select
        (SELECT COUNT(descricao) FROM respostas WHERE descricao = 'sim' AND fkPergunta = ${idPergunta}) AS Sim,
        (SELECT COUNT(descricao) FROM respostas WHERE descricao = 'nao' AND fkPergunta = ${idPergunta}) AS Nao
      FROM respostas limit 1;`;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idPergunta) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select 
        descricao as descricao
                    from respostas
                    where fkPergunta = ${idPergunta}
                    order by id desc limit ${limite_linhas}`

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        descricao as descricao
                    from respostas
                    where fkPergunta = ${idPergunta}
                    order by id desc limit ${limite_linhas}`
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrarRespostas(p1, p2, p3, p4) {
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
    INSERT INTO respostas VALUES 
    (null, '${p1}', 1),
    (null, '${p2}', 2),
    (null, '${p3}', 3),
    (null, '${p4}', 4);
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    cadastrarRespostas
}

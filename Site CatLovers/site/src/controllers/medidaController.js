var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 1;

    var idPergunta = req.params.idPergunta;


    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    medidaModel.buscarUltimasMedidas(idPergunta, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarMedidasEmTempoReal(req, res) {

    var idPergunta = req.params.idPergunta;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idPergunta).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        // console.log(erro);
        console.log("Sem novas atualizações nos gráficos.");
        // res.status(500).json(erro.sqlMessage);
    });
}

function cadastrarRespostas(req, res) {
    console.log("Aqui começa o controlller");
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var p1 = req.body.p1Server;
    var p2 = req.body.p2Server;
    var p3 = req.body.p3Server;
    var p4 = req.body.p4Server;

    // Faça as validações dos valores
    if (p1 == undefined) {
        res.status(400).send("O nome do gato está undefined!");

    } else if (p2 == undefined) {
        res.status(400).send("O sexo do gato está undefined!");

    } else if (p3 == undefined) {
        res.status(400).send("A idade do gato está undefined!");

    } else if (p4 == undefined) {
        res.status(400).send("O porte do gato está undefined!");

    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        medidaModel.cadastrarRespostas(p1, p2, p3, p4)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro das perguntas! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    cadastrarRespostas

}
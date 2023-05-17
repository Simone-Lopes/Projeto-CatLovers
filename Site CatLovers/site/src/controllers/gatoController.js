var gatoModel = require("../models/gatoModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA gatoController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
    gatoModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function entrar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {
        
        usuarioModel.entrar(email, senha)
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                    if (resultado.length == 1) {
                        console.log(resultado);
                        res.json(resultado[0]);
                    } else if (resultado.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrarGato(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nomeGato = req.body.nomeGatoServer;
    var sexo = req.body.sexoServer;
    var idade = req.body.idadeServer;
    var porte = req.body.porteServer;
    var vacina = req.body.vacinaServer;
    var castrado = req.body.castradoServer;
    var pelagem = req.body.pelagemServer;
    var tamanho = req.body.tamanhoServer;
    var peso = req.body.pesoServer;
    var historia = req.body.historiaServer;
    var link = req.body.linkServer;
    var imagem = req.body.imagemServer;
    var confirmarEmail = req.body.confirmarEmailServer;

    // Faça as validações dos valores
    if (nomeGato == undefined) {
        res.status(400).send("O nome do gato está undefined!");

    } else if (sexo == undefined) {
        res.status(400).send("O sexo do gato está undefined!");

    } else if (idade == undefined) {
        res.status(400).send("A idade do gato está undefined!");

    } else if (porte == undefined) {
        res.status(400).send("O porte do gato está undefined!");

    } else if (vacina == undefined) {
        res.status(400).send("A vacina do gato está undefined!");

    } else if (castrado == undefined) {
        res.status(400).send("A castração do gato está undefined!");

    } else if (pelagem == undefined) {
        res.status(400).send("A pelagem do gato está undefined!");

    } else if (tamanho == undefined) {
        res.status(400).send("O tamanho do gato está undefined!");

    } else if (peso == undefined) {
        res.status(400).send("O peso do gato está undefined!");

    } else if (historia == undefined) {
        res.status(400).send("A história do gato está undefined!");

    } else if (link == undefined) {
        res.status(400).send("O link de fotos do gato está undefined!");

    } else if (imagem == undefined) {
        res.status(400).send("A imagem do gato está undefined!");

    } else if (confirmarEmail == undefined) {
        res.status(400).send("O seu email está undefined!");
    } else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        GatoModel.cadastrarGato(nomeGato, sexo, idade, porte, vacina, castrado, pelagem, tamanho, peso, historia, link, imagem, confirmarEmail)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro do gatinho! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    entrar,
    cadastrarGato,
    listar,
    testar
}
var express = require("express");
var router = express.Router();

var gatoController = require("../controllers/gatoController");

router.get("/", function (req, res) {
    gatoController.testar(req, res);
});

router.get("/listar", function (req, res) {
    gatoController.listar(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrarGato", function (req, res) {
    console.log("Entrou no router");
    gatoController.cadastrarGato(req, res);
})

router.post("/autenticar", function (req, res) {
    gatoController.entrar(req, res);
});

module.exports = router;
<?php
class userClass {
    protected $id;
    protected $nome;
    protected $email;
    protected $senha;
    protected $tipo_user_id;
    
    public function getId() {
        return $this->id;
    }

    public function getNome() {
        return $this->nome;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getSenha() {
        return $this->senha;
    }

    public function getTipo_user_id() {
        return $this->tipo_user_id;
    }

    public function setId($id): void {
        $this->id = $id;
    }

    public function setNome($nome): void {
        $this->nome = $nome;
    }

    public function setEmail($email): void {
        $this->email = $email;
    }

    public function setSenha($senha): void {
        $this->senha = $senha;
    }

    public function setTipo_user_id($tipo_user_id): void {
        $this->tipo_user_id = $tipo_user_id;
    }

    public function __construct() {
        
    }

}

# **Medidas Iteradores**

![DAX](https://img.shields.io/badge/DAX-Power%20BI-yellow)

## **Sumário**
- **[Estrutura](#Estrutura)**
- **[Lógica de Funcionamento](#lógica-de-funcionamento)**
    - [A lógica pode ser representada como:](#a-lógica-pode-ser-representada-como)
    - [Filtro aplicado na expressão](#filtro-aplicado-na-expressão)
    - [Filtro aplicado na tabela](#filtro-aplicado-na-tabela)
- **[Exemplos práticos](#exemplos-práticos)**
    - [SUMX](#sumx)
    - [AVARAGEX](#avaragex)
    - [MAXX](#maxx)
    - [COUNTX](#countx)

---

As Funções de Iteração, por outro lado, ao invés de generalizar, verificam célula por célula de uma coluna para obter o resultado. Isso permite a utilização de filtros ou a realização de operações, retirando os dados que não serão utilizados. 

Algumas das principais são: 

- `SUMX`
- `AVERAGEX`
- `MAXX`
- `MINX` 
- `COUNTX`
- `DISTINCTCOUNTX`

## Estrutura

```
[Nome_da_Medida] = 
    [Função](
        [Tabela],
        [Operação]
    )
```
A [função] pode ser qualquer exemplar das funções de iteração mostradas anteriormente (`SUMX`, `AVERAGEX`, `MAXX`, `MINX`,`COUNTX`, `DISTINCTCOUNTX`)

## Lógica de Funcionamento

As funções iteradoras (SUMX, AVERAGEX, COUNTX, MAXX, etc.) percorrem uma tabela linha a linha, aplicando uma expressão para cada linha e, posteriormente, realizando a operação definida pela função sobre os resultados.

### A lógica pode ser representada como:
```
[Tabela]
   ↓
[Expressão aplicada a cada linha]
   ↓
[Resultados]
   ↓
[Função de agregação]
```
Por exemplo:
```
SUMX(
    Vendas,
    Vendas[Quantidade] * Vendas[PreçoUnitário]
)
```
O cálculo ocorre conceitualmente da seguinte maneira:
```
Linha 1 → Quantidade × PreçoUnitário → Resultado 1
Linha 2 → Quantidade × PreçoUnitário → Resultado 2
Linha 3 → Quantidade × PreçoUnitário → Resultado 3
                    ↓
                  SUMX
                    ↓
             Soma dos resultados
```

### Filtro aplicado na expressão

É possível utilizar uma condição dentro da expressão que será avaliada pelo iterador:
```
COUNTX(
    Vendas,
    IF(
        Vendas[Quantidade] * Vendas[PreçoUnitário] > 500,
        1
    )
)
```
Nesse caso, o IF é avaliado para cada linha durante a iteração.

**Conceitualmente:**
```
[Tabela]
   ↓
[Itera linha a linha]
   ↓
[IF é avaliado em cada linha]
   ↓
[Resultados]
   ↓
[COUNTX]
```
Assim, o filtro faz parte da expressão que será avaliada durante a iteração.

### Filtro aplicado na tabela

Também é possível filtrar a tabela antes de entregá-la ao iterador, utilizando, por exemplo, FILTER:
```
SUMX(
    FILTER(
        Vendas,
        Vendas[Quantidade] * Vendas[PreçoUnitário] > 500
    ),
    Vendas[Quantidade] * Vendas[PreçoUnitário]
)
```
Nesse caso, o fluxo conceitual é:
```
[Tabela original]
       ↓
    FILTER
       ↓
[Tabela filtrada]
       ↓
     SUMX
       ↓
[Expressão aplicada às linhas]
       ↓
[Resultado agregado]
```
A principal diferença é onde a condição é aplicada:
```
COUNTX(
    Tabela,
    condição + expressão
)
```
→ A condição faz parte da expressão avaliada durante a iteração.

Enquanto:
```
SUMX(
    FILTER(Tabela, condição),
    expressão
)
```
→ A condição determina quais linhas farão parte da tabela que será iterada.

*Essa distinção se torna especialmente importante em expressões DAX mais complexas, nas quais a tabela passada para o iterador pode ser uma tabela virtual criada por funções como FILTER, VALUES, ADDCOLUMNS, SUMMARIZE etc.*

## Exemplos práticos

#### **ATENÇÃO!**
Os exemplos seguirão como base o mesmo workspace constuído no power bi até então, onde os dados foram importados.

Saiba mais sobre a construção, importação de dados, e outras informações sobre o projeto, que será a base dos exemplos aqui citados, no **[00-README](/dax/00-README.md)**.

### `SUMX`

### `AVARAGEX`

### `MAXX`

### `COUNTX`
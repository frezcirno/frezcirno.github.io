---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠==


# Text Elements
Compiler
---------
front::Lexer
front::Parser
mid::Evaluator
mid::Analyzer
mid::IRBuilder
opt::PassManager
---------------------
Open()
CompileToIR()
RunPasses()
GenerateCode(CodeGen&) ^kwstvisy

Parser
--------
front::Lexer
Token cur_token_
bool ended_
---------------
Reset()
ParseNext() -> ASTPtr
ended() ^s3gLSJjk

BaseType ^XD0ns8Cs

PrimType ^zwkC3AFD

StructType ^GHLRm1CY

ConstType ^6WkG71gW

FuncType ^bhrOiSTH

ArrayType ^uaIKFlUf

PointerType ^0isyS1hF

TypePtr = shared_ptr<BaseType> ^RzfESAhp

BaseAST
-----------
TypePtr
-----------
Dump(ostream&)
SemaAnalyze(Analyzer&)
Eval(Evaluator&)
GenerateIR(IRBuilder*) ^nQRl9RR4

VarDeclAST ^eweSDhyi

VarDefAST ^UNrA8x7U

InitListAST ^W1YvONCL

FuncDeclAST ^eFFJXZAw

FuncDefAST ^bcb7pszY

.... ^s60FETfA

ASTPtr = shared_ptr<BaseAST> ^CMA03osA

Lexer
-------
istream* in
-------------
Reset()
NextToken() ^tyoaD7O5

Analyzer
----------
Evalutor &
-------------
Reset()
AnalyzeOn(VarDeclAST) -> TypePtr
AnalyzeOn(VarDefAST) -> TypePtr
AnalyzeOn(InitListAST) -> TypePtr
AnalyzeOn(FuncDeclAST) -> TypePtr
AnalyzeOn(FuncDefAST) -> TypePtr
AnalyzeOn(...) -> TypePtr ^9Fr01rAo

Evaluator
========
Reset()
EvalOn(ValDeclAST&)
 -> std::optional<std::uint32_t>
EvalOn(VarDefAST&)
 -> std::optional<std::uint32_t>
EvalOn(...)
 -> std::optional<std::uint32_t> ^YbvqdIHD

IRBuilder
-----------
Module
-----------
Reset()
GenerateOn(ValDeclAST&) -> SSAPtr
GenerateOn(VarDefAST&) -> SSAPtr
GenerateOn(InitListAST&) -> SSAPtr
GenerateOn(FuncDeclAST&) -> SSAPtr
GenerateOn(FuncDefAST&) -> SSAPtr
GenerateOn(...) -> SSAPtr ^11Aaf5QW

SSAPtr = shared_ptr<Value> ^teDgxHZx

Value
------
TypePtr
list<Use *> customer
-------------------------
Dump(ostream&)
RunPass(PassBase&)
GenerateCode(CodeGen&)
AddUse(Use*)
RemoveUse(Use*)
uses() -> list<Use*>
ReplaceBy(SSAPtr&)
GetPointer() -> SSAPtr ^8GrGxVyu

User
------
vector<Use>
---------------
AddValue(SSAPtr&) ^3aW2p9kc

Use
-----
SSAPtr
User*
-------
set_value(SSAPtr&)
value() -> SSAPtr&
user() -> User* ^rEIrR8NK

PassManager
----------------
PassStage
-------------
(S) RegisterPass(string)
RequiredBy(string, string)
(S) GetPass(string) -> T
RunPasses() ^q585Vbbf

PassBase
========
IsModulePass()
RunOnModule()
IsFunctionPass()
RunOnFunction(FuncPtr&)
IsBlockPass()
RunOnBlock(BlockPtr&)
Initialize()
CleanUp()
RunOn(LoadSSA&)
RunOn(StoreSSA&)
RunOn(AccessSSA&)
RunOn(BinarySSA&)
RunOn(....&) ^Mah5JKJ2

PassPtr = unique_ptr<PassBase> ^Mj7CSKoe

ModulePass ^RfLrTVlL

FunctionPass ^s9xIL8lA

BlockPass ^H6wHZt3e

HelperPass ^ocJm321F

PassStage ::= PreOpt 
| Promote | Opt 
| Demote | PostOpt ^mAfzGYdg

PassInfo
-----------
PassPtr
PassStage
-------------
Requires() -> PassInfo&
Invalidates()-> PassInfo&
pass() -> PassPtr&
name() -> string
stages() -> PassStage ^AIAgaLDg

CodeGen
(CodeGenInterface)
================
GenerateOn(LoadSSA&)
GenerateOn(StoreSSA&)
GenerateOn(AccessSSA&)
GenerateOn(BinarySSA&)
GenerateOn(UnarySSA&)
GenerateOn(...)
Dump(ostream&) ^VutfA4EI

AsmCodeGen
---------------
ArchInfoPtr
--------------
SetTargetArch(string) ^cNs2rfHK

ArchInfoPtr = shared_ptr<ArchInfoBase> ^oDi28pe0

ArchInfoBase
 ^fClj3OSQ

ArchManager
---------------
unord_map<str, ArchEntry>
--------------------------------
(S) RegisterArch(name, entry)
(S) GetArch(name)->ArchInfoPtr ^3yyDoZpW

ArchEntry
------------
ArchInfoPtr
--------------
arch_info()->ArchInfoPtr ^ABNwInpM

CCodeGen
------------
vector<TypeInfo>
---------------------
Reset() ^z46O2BE1

PassPtr = unique_ptr<PassInterface> ^rvK6YkQw

PassInterface
============
RunOn(OprPtr&,
InstPtrList&) ^5C3i3LbR

BranchCombiningPass ^61leLIGZ

BranchEliminationPass ^Co48HahS

FuncDecoratePass ^2NQZeWVV

....Pass ^yZ04PNKT

InstGenBase
----------------
CodeGen*
------------
GenerateOn(LoadSSA&)
GenerateOn(StoreSSA&)
GenerateOn(AccessSSA&)
GenerateOn(BinarySSA&)
GenerateOn(UnarySSA&)
GenerateOn(...)
Dump(ostream&)
RunPass(PassPtr&) ^e1sw1KQE

AArch32ArchInfo
--------------------
(S) AArch32InstGen
(S) RegList
--------------
GetPtrSize()
GetInstGen() -> InstGenBase
GetPassList(optlvl) ^e8ULuLsL

RISCV32ArchInfo
--------------------
(S) RISCV32InstGen
(S) RegList
--------------
GetPtrSize()
GetInstGen() -> InstGenBase
GetPassList(optlvl) ^bXj2e6jF

Lexical & Grammar Analysis ^cqYhg1sl

Semantic Analysis ^ErGnCq7Y

IR Generation ^wA7AtETG

IR Optimization ^rq4rE7nu

Target Code Generation ^spCKybjN

%%
# Drawing
```json
{
	"type": "excalidraw",
	"version": 2,
	"source": "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/tag/2.1.7",
	"elements": [
		{
			"type": "rectangle",
			"version": 706,
			"versionNonce": 1693579972,
			"index": "a0",
			"isDeleted": false,
			"id": "NvEc2cN2tgy59xijwbPbI",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 204.7041937264254,
			"y": -869.8061914369828,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 424.2909434925426,
			"height": 404.3636141690341,
			"seed": 1110524661,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "kwstvisy"
				},
				{
					"id": "kZq1LU8chpNVkX_CmzvZX",
					"type": "arrow"
				},
				{
					"id": "Li1CSx_AtPR_JuZu1X5I0",
					"type": "arrow"
				},
				{
					"id": "LntipuYUKtMEDSxIUlfLX",
					"type": "arrow"
				},
				{
					"id": "nqhZdoHGuSIkgxgOwyRde",
					"type": "arrow"
				},
				{
					"id": "vr2EkD9IRNVZOS9-VHqGR",
					"type": "arrow"
				},
				{
					"id": "fV98u6CfqkLjaDxq2kSAj",
					"type": "arrow"
				}
			],
			"updated": 1714993186841,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 907,
			"versionNonce": 2112750148,
			"index": "a0V",
			"isDeleted": false,
			"id": "kwstvisy",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 292.2297695376381,
			"y": -830.1243843524658,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 249.2397918701172,
			"height": 325,
			"seed": 1930013787,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993186841,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "Compiler\n---------\nfront::Lexer\nfront::Parser\nmid::Evaluator\nmid::Analyzer\nmid::IRBuilder\nopt::PassManager\n---------------------\nOpen()\nCompileToIR()\nRunPasses()\nGenerateCode(CodeGen&)",
			"rawText": "Compiler\n---------\nfront::Lexer\nfront::Parser\nmid::Evaluator\nmid::Analyzer\nmid::IRBuilder\nopt::PassManager\n---------------------\nOpen()\nCompileToIR()\nRunPasses()\nGenerateCode(CodeGen&)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "NvEc2cN2tgy59xijwbPbI",
			"originalText": "Compiler\n---------\nfront::Lexer\nfront::Parser\nmid::Evaluator\nmid::Analyzer\nmid::IRBuilder\nopt::PassManager\n---------------------\nOpen()\nCompileToIR()\nRunPasses()\nGenerateCode(CodeGen&)",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1447,
			"versionNonce": 1271581380,
			"index": "a2",
			"isDeleted": false,
			"id": "8mQoUk3UDkLggDBllXmX_",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -563.2281775849868,
			"y": -1392.0808151750764,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 264.67282995530564,
			"height": 260,
			"seed": 1651920123,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "s3gLSJjk"
				},
				{
					"id": "vxj9FwK3n2ccoUK_UJ1ZD",
					"type": "arrow"
				},
				{
					"id": "kZq1LU8chpNVkX_CmzvZX",
					"type": "arrow"
				},
				{
					"id": "K4mCBHH3sb-x4c24qkK_b",
					"type": "arrow"
				},
				{
					"id": "LntipuYUKtMEDSxIUlfLX",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1556,
			"versionNonce": 825020996,
			"index": "a2V",
			"isDeleted": false,
			"id": "s3gLSJjk",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -546.2816628148536,
			"y": -1374.5808151750764,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 230.77980041503906,
			"height": 225,
			"seed": 775951291,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "Parser\n--------\nfront::Lexer\nToken cur_token_\nbool ended_\n---------------\nReset()\nParseNext() -> ASTPtr\nended()",
			"rawText": "Parser\n--------\nfront::Lexer\nToken cur_token_\nbool ended_\n---------------\nReset()\nParseNext() -> ASTPtr\nended()",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "8mQoUk3UDkLggDBllXmX_",
			"originalText": "Parser\n--------\nfront::Lexer\nToken cur_token_\nbool ended_\n---------------\nReset()\nParseNext() -> ASTPtr\nended()",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 913,
			"versionNonce": 1396454140,
			"index": "a5",
			"isDeleted": false,
			"id": "KLDMMt05vWKLJiHSsfHhx",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -429.2210397836188,
			"y": 304.93963165113723,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 50.4000244140625,
			"seed": 1679915643,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "XD0ns8Cs"
				},
				{
					"id": "K9NlJvrHfNa_G4f3iDpcQ",
					"type": "arrow"
				},
				{
					"id": "G9mW3dpWTASGhTzNyb8D2",
					"type": "arrow"
				},
				{
					"id": "NNpPrYY54HJlFyNkNFLwc",
					"type": "arrow"
				},
				{
					"id": "41hrQnQOKEXDQEBMCZKAr",
					"type": "arrow"
				},
				{
					"id": "lYqz-fqoNSwoUrzcNHD7W",
					"type": "arrow"
				},
				{
					"id": "yWxVISjSL7YE8EtM97rMw",
					"type": "arrow"
				},
				{
					"id": "fTOJOO_PWaMccBMl9ilvD",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 881,
			"versionNonce": 2008314748,
			"index": "a6",
			"isDeleted": false,
			"id": "XD0ns8Cs",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -403.9910135385016,
			"y": 317.6396438581685,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 95.93991088867188,
			"height": 25,
			"seed": 656602933,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "BaseType",
			"rawText": "BaseType",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "KLDMMt05vWKLJiHSsfHhx",
			"originalText": "BaseType",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 532,
			"versionNonce": 699152252,
			"index": "a7",
			"isDeleted": false,
			"id": "zRKTelEnRVN6s3I37uL8Y",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -140.99314928308922,
			"y": 201.1202853513346,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 42.4000244140625,
			"seed": 254064379,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "zwkC3AFD"
				},
				{
					"id": "G9mW3dpWTASGhTzNyb8D2",
					"type": "arrow"
				},
				{
					"id": "K9NlJvrHfNa_G4f3iDpcQ",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 522,
			"versionNonce": 2058348540,
			"index": "a8",
			"isDeleted": false,
			"id": "zwkC3AFD",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -110.35311937586266,
			"y": 209.82029755836584,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 85.11990356445312,
			"height": 25,
			"seed": 554311579,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PrimType",
			"rawText": "PrimType",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "zRKTelEnRVN6s3I37uL8Y",
			"originalText": "PrimType",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 493,
			"versionNonce": 1075517692,
			"index": "aC",
			"isDeleted": false,
			"id": "oEKnjViNa4OofqQubj1e8",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -139.19322252527672,
			"y": 259.3202365232096,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 43.20001220703125,
			"seed": 1970402581,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "GHLRm1CY"
				},
				{
					"id": "G9mW3dpWTASGhTzNyb8D2",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 487,
			"versionNonce": 1942395260,
			"index": "aD",
			"isDeleted": false,
			"id": "GHLRm1CY",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -121.50318193689782,
			"y": 268.4202426267252,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 111.01988220214844,
			"height": 25,
			"seed": 570198645,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "StructType",
			"rawText": "StructType",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "oEKnjViNa4OofqQubj1e8",
			"originalText": "StructType",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 2247,
			"versionNonce": 79099716,
			"index": "aH",
			"isDeleted": false,
			"id": "K9NlJvrHfNa_G4f3iDpcQ",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -281.8210764047125,
			"y": 320.6736475221662,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 139.82792712162325,
			"height": 89.05445938944143,
			"seed": 1975294651,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140597,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "KLDMMt05vWKLJiHSsfHhx",
				"focus": 0.5261891739320155,
				"gap": 1
			},
			"endBinding": {
				"elementId": "zRKTelEnRVN6s3I37uL8Y",
				"focus": 0.5596875580544135,
				"gap": 1.0000000000000568
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					139.82792712162325,
					-89.05445938944143
				]
			]
		},
		{
			"type": "arrow",
			"version": 2333,
			"versionNonce": 1155493572,
			"index": "aI",
			"isDeleted": false,
			"id": "G9mW3dpWTASGhTzNyb8D2",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -281.82107640471247,
			"y": 308.82408045327264,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 94.55057901085685,
			"height": 5.396870840950015,
			"seed": 859025013,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140597,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "KLDMMt05vWKLJiHSsfHhx",
				"focus": -0.581393125209553,
				"gap": 1.0000000000000568
			},
			"endBinding": null,
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					94.55057901085685,
					-5.396870840950015
				]
			]
		},
		{
			"type": "rectangle",
			"version": 543,
			"versionNonce": 150518524,
			"index": "aJ",
			"isDeleted": false,
			"id": "vzONpsSfu4Nyl7qAEndpE",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -139.59318590418297,
			"y": 316.7202609372721,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 40.818204012784236,
			"seed": 1310492053,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "6WkG71gW"
				},
				{
					"id": "NNpPrYY54HJlFyNkNFLwc",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 543,
			"versionNonce": 1419770748,
			"index": "aK",
			"isDeleted": false,
			"id": "6WkG71gW",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -117.25315141931969,
			"y": 324.6293629436642,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 101.71989440917969,
			"height": 25,
			"seed": 402721525,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "ConstType",
			"rawText": "ConstType",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "vzONpsSfu4Nyl7qAEndpE",
			"originalText": "ConstType",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 601,
			"versionNonce": 1287408764,
			"index": "aO",
			"isDeleted": false,
			"id": "6E0aiHYSmN4puOlNYYJik",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -140.94781403362197,
			"y": 373.87476588666846,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 42.76370516690349,
			"seed": 706772763,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "bhrOiSTH"
				},
				{
					"id": "41hrQnQOKEXDQEBMCZKAr",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 598,
			"versionNonce": 1291148540,
			"index": "aP",
			"isDeleted": false,
			"id": "bhrOiSTH",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -111.98779206096572,
			"y": 382.7566184701202,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 88.47991943359375,
			"height": 25,
			"seed": 1436017595,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "FuncType",
			"rawText": "FuncType",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "6E0aiHYSmN4puOlNYYJik",
			"originalText": "FuncType",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 581,
			"versionNonce": 491212284,
			"index": "aQ",
			"isDeleted": false,
			"id": "ukmrItpEmuNrSDwLKpPRc",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -142.34783844768447,
			"y": 432.58380019952347,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 38.4000244140625,
			"seed": 838448219,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "uaIKFlUf"
				},
				{
					"id": "lYqz-fqoNSwoUrzcNHD7W",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 581,
			"versionNonce": 665071228,
			"index": "aR",
			"isDeleted": false,
			"id": "uaIKFlUf",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -118.79781250774306,
			"y": 439.2838124065547,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 99.29991149902344,
			"height": 25,
			"seed": 253260027,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "ArrayType",
			"rawText": "ArrayType",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "ukmrItpEmuNrSDwLKpPRc",
			"originalText": "ArrayType",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 668,
			"versionNonce": 1016053628,
			"index": "aS",
			"isDeleted": false,
			"id": "2Yo-gmwEPX6A6YLmtAvIw",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -141.14776520549697,
			"y": 489.9838856487422,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 39.800048828125,
			"seed": 511089051,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "0isyS1hF"
				},
				{
					"id": "yWxVISjSL7YE8EtM97rMw",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 680,
			"versionNonce": 2011328508,
			"index": "aT",
			"isDeleted": false,
			"id": "0isyS1hF",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -125.50772003948134,
			"y": 497.3839100628047,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 115.119873046875,
			"height": 25,
			"seed": 1028042299,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PointerType",
			"rawText": "PointerType",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "2Yo-gmwEPX6A6YLmtAvIw",
			"originalText": "PointerType",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 2264,
			"versionNonce": 1797098948,
			"index": "aX",
			"isDeleted": false,
			"id": "NNpPrYY54HJlFyNkNFLwc",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -279.44455804574244,
			"y": 313.75319079152985,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 138.85137214155944,
			"height": 37.27335868316828,
			"seed": 651711541,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140597,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "KLDMMt05vWKLJiHSsfHhx",
				"focus": -0.8236970385925158,
				"gap": 3.3765183589700882
			},
			"endBinding": {
				"elementId": "vzONpsSfu4Nyl7qAEndpE",
				"focus": -0.8441428478625673,
				"gap": 1.0000000000000284
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					138.85137214155944,
					37.27335868316828
				]
			]
		},
		{
			"type": "arrow",
			"version": 2315,
			"versionNonce": 27258052,
			"index": "aY",
			"isDeleted": false,
			"id": "41hrQnQOKEXDQEBMCZKAr",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -280.1843455081099,
			"y": 312.8632596939608,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 138.23653147448795,
			"height": 96.09310551393583,
			"seed": 1222737685,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140597,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "KLDMMt05vWKLJiHSsfHhx",
				"focus": -0.9199470287159659,
				"gap": 2.6367308966026144
			},
			"endBinding": {
				"elementId": "6E0aiHYSmN4puOlNYYJik",
				"focus": -0.9033156038725034,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					138.23653147448795,
					96.09310551393583
				]
			]
		},
		{
			"type": "arrow",
			"version": 2348,
			"versionNonce": 1951828932,
			"index": "aZ",
			"isDeleted": false,
			"id": "lYqz-fqoNSwoUrzcNHD7W",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -281.8210764047125,
			"y": 313.52804408240263,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 138.47323795702806,
			"height": 147.8131037904509,
			"seed": 648072917,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140598,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "KLDMMt05vWKLJiHSsfHhx",
				"focus": -0.9272192413171241,
				"gap": 1
			},
			"endBinding": {
				"elementId": "ukmrItpEmuNrSDwLKpPRc",
				"focus": -0.9119018901190769,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					138.47323795702806,
					147.8131037904509
				]
			]
		},
		{
			"type": "arrow",
			"version": 2387,
			"versionNonce": 1932618436,
			"index": "aa",
			"isDeleted": false,
			"id": "yWxVISjSL7YE8EtM97rMw",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -281.0815129839098,
			"y": 314.44814925082846,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 138.93374777841285,
			"height": 203.64406701848407,
			"seed": 1136083797,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140598,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "KLDMMt05vWKLJiHSsfHhx",
				"focus": -0.9474788772482172,
				"gap": 1.7395634208027104
			},
			"endBinding": {
				"elementId": "2Yo-gmwEPX6A6YLmtAvIw",
				"focus": -0.919603429540953,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					138.93374777841285,
					203.64406701848407
				]
			]
		},
		{
			"type": "rectangle",
			"version": 714,
			"versionNonce": 1889878780,
			"index": "aaV",
			"isDeleted": false,
			"id": "6ayKAEJAXUIdsIayFvP3c",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -379.0778404505256,
			"y": 101.94082251728389,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 386.5406750000001,
			"height": 50.40002441406253,
			"seed": 116871707,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "RzfESAhp",
					"type": "text"
				},
				{
					"id": "PaWe34uVs614eeWB2iR-_",
					"type": "arrow"
				},
				{
					"id": "fTOJOO_PWaMccBMl9ilvD",
					"type": "arrow"
				},
				{
					"id": "m8hipY5XLyHI1RYOVepQG",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 756,
			"versionNonce": 628851580,
			"index": "ab",
			"isDeleted": false,
			"id": "RzfESAhp",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -356.17734547982246,
			"y": 114.64083472431516,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 340.73968505859375,
			"height": 25,
			"seed": 179168507,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "TypePtr = shared_ptr<BaseType>",
			"rawText": "TypePtr = shared_ptr<BaseType>",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "6ayKAEJAXUIdsIayFvP3c",
			"originalText": "TypePtr = shared_ptr<BaseType>",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1425,
			"versionNonce": 1108142020,
			"index": "ac",
			"isDeleted": false,
			"id": "-RHac_BzGHkEkXSOB4DX_",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -789.9641428107191,
			"y": -896.7643100140406,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 262.8887130253995,
			"height": 244.11764705882356,
			"seed": 352362971,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "nQRl9RR4"
				},
				{
					"id": "Xvx7J3k78K6qcR32EJR8o",
					"type": "arrow"
				},
				{
					"id": "ca0umHfs28s8CpEZFprME",
					"type": "arrow"
				},
				{
					"id": "BzBfv3VMkhNPjT1yMH_-a",
					"type": "arrow"
				},
				{
					"id": "_nYmZ-yQ_1Y7Z7W5C_cbY",
					"type": "arrow"
				},
				{
					"id": "qowei3lhqCaStuYYmkIb1",
					"type": "arrow"
				},
				{
					"id": "n-Nb82_fZhnIwgII1KSqJ",
					"type": "arrow"
				},
				{
					"id": "eE9qfkdi1cLKdbcVK9Vyf",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1541,
			"versionNonce": 857952068,
			"index": "ad",
			"isDeleted": false,
			"id": "nQRl9RR4",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -774.9096941349334,
			"y": -874.7054864846288,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 232.77981567382812,
			"height": 200,
			"seed": 501591675,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "BaseAST\n-----------\nTypePtr\n-----------\nDump(ostream&)\nSemaAnalyze(Analyzer&)\nEval(Evaluator&)\nGenerateIR(IRBuilder*)",
			"rawText": "BaseAST\n-----------\nTypePtr\n-----------\nDump(ostream&)\nSemaAnalyze(Analyzer&)\nEval(Evaluator&)\nGenerateIR(IRBuilder*)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "-RHac_BzGHkEkXSOB4DX_",
			"originalText": "BaseAST\n-----------\nTypePtr\n-----------\nDump(ostream&)\nSemaAnalyze(Analyzer&)\nEval(Evaluator&)\nGenerateIR(IRBuilder*)",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 994,
			"versionNonce": 1865206596,
			"index": "ae",
			"isDeleted": false,
			"id": "OAgh_t_1_QovpCJ_3uoav",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -382.3104766476056,
			"y": -911.1813224806278,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 42.4000244140625,
			"seed": 734013211,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "eweSDhyi"
				},
				{
					"id": "Xvx7J3k78K6qcR32EJR8o",
					"type": "arrow"
				},
				{
					"id": "ca0umHfs28s8CpEZFprME",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 987,
			"versionNonce": 159040196,
			"index": "af",
			"isDeleted": false,
			"id": "eweSDhyi",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -366.85045467494933,
			"y": -902.4813102735966,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 115.47991943359375,
			"height": 25,
			"seed": 1426230203,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "VarDeclAST",
			"rawText": "VarDeclAST",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "OAgh_t_1_QovpCJ_3uoav",
			"originalText": "VarDeclAST",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1013,
			"versionNonce": 1475600836,
			"index": "ag",
			"isDeleted": false,
			"id": "rw5svV7vg9IYnw4SzrKMi",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -383.74488788979306,
			"y": -847.6234276091399,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 43.20001220703125,
			"seed": 1036999771,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "UNrA8x7U"
				},
				{
					"id": "ca0umHfs28s8CpEZFprME",
					"type": "arrow"
				},
				{
					"id": "Xvx7J3k78K6qcR32EJR8o",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1007,
			"versionNonce": 639306052,
			"index": "ah",
			"isDeleted": false,
			"id": "UNrA8x7U",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -365.49486500160947,
			"y": -838.5234215056242,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 109.89991760253906,
			"height": 25,
			"seed": 1643714811,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "VarDefAST",
			"rawText": "VarDefAST",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "rw5svV7vg9IYnw4SzrKMi",
			"originalText": "VarDefAST",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 3849,
			"versionNonce": 1710370172,
			"index": "ai",
			"isDeleted": false,
			"id": "Xvx7J3k78K6qcR32EJR8o",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -525.1342676759446,
			"y": -859.2043937919832,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 139.80092751305108,
			"height": 33.41616542673739,
			"seed": 520241563,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146844,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "-RHac_BzGHkEkXSOB4DX_",
				"focus": -0.3428266754325354,
				"gap": 1.941162109375
			},
			"endBinding": {
				"elementId": "OAgh_t_1_QovpCJ_3uoav",
				"focus": 0.5390256389836634,
				"gap": 3.022863515287895
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					139.80092751305108,
					-33.41616542673739
				]
			]
		},
		{
			"type": "arrow",
			"version": 4053,
			"versionNonce": 1353318012,
			"index": "aj",
			"isDeleted": false,
			"id": "ca0umHfs28s8CpEZFprME",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -525.1342676759446,
			"y": -865.6136175406651,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 140.3893797861515,
			"height": 49.4154995278418,
			"seed": 2115851835,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146844,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "-RHac_BzGHkEkXSOB4DX_",
				"focus": -0.8189972681274501,
				"gap": 1.941162109375
			},
			"endBinding": {
				"elementId": "rw5svV7vg9IYnw4SzrKMi",
				"focus": -0.7588393829713079,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					140.3893797861515,
					49.4154995278418
				]
			]
		},
		{
			"type": "rectangle",
			"version": 1007,
			"versionNonce": 754599748,
			"index": "ak",
			"isDeleted": false,
			"id": "vwa3DLAdPOBM4pR3cxNQZ",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -382.34937299911235,
			"y": -782.6313897650514,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 35,
			"seed": 1043125979,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "W1YvONCL"
				},
				{
					"id": "BzBfv3VMkhNPjT1yMH_-a",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1011,
			"versionNonce": 674807492,
			"index": "al",
			"isDeleted": false,
			"id": "W1YvONCL",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -367.0493394297764,
			"y": -777.6313897650514,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 115.79989624023438,
			"height": 25,
			"seed": 499336059,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "InitListAST",
			"rawText": "InitListAST",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "vwa3DLAdPOBM4pR3cxNQZ",
			"originalText": "InitListAST",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1056,
			"versionNonce": 610459076,
			"index": "am",
			"isDeleted": false,
			"id": "dKol9XUNmsCMRTMRk1UC1",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -380.8105071651837,
			"y": -716.8592801847461,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 38.4000244140625,
			"seed": 1696799771,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "eFFJXZAw"
				},
				{
					"id": "_nYmZ-yQ_1Y7Z7W5C_cbY",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1056,
			"versionNonce": 55215428,
			"index": "an",
			"isDeleted": false,
			"id": "eFFJXZAw",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -370.32047878383605,
			"y": -710.1592679777149,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 125.41990661621094,
			"height": 25,
			"seed": 809427131,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "FuncDeclAST",
			"rawText": "FuncDeclAST",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "dKol9XUNmsCMRTMRk1UC1",
			"originalText": "FuncDeclAST",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1045,
			"versionNonce": 93652036,
			"index": "ao",
			"isDeleted": false,
			"id": "rBuVLC_y1zT_WYkPq4_8X",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -382.2105315792462,
			"y": -652.4260242313384,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 38.4000244140625,
			"seed": 2025394523,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "bcb7pszY"
				},
				{
					"id": "qowei3lhqCaStuYYmkIb1",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1048,
			"versionNonce": 2020858820,
			"index": "ap",
			"isDeleted": false,
			"id": "bcb7pszY",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -368.9305022823712,
			"y": -645.7260120243071,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 119.83990478515625,
			"height": 25,
			"seed": 1608789499,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "FuncDefAST",
			"rawText": "FuncDefAST",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "rBuVLC_y1zT_WYkPq4_8X",
			"originalText": "FuncDefAST",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1154,
			"versionNonce": 1815788228,
			"index": "aq",
			"isDeleted": false,
			"id": "qoWWRta0BUhMQCtlJywWG",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -381.5715346050521,
			"y": -594.5870637929174,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 146.39996337890625,
			"height": 44.000015258789055,
			"seed": 952284827,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "s60FETfA"
				},
				{
					"id": "n-Nb82_fZhnIwgII1KSqJ",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1174,
			"versionNonce": 505332292,
			"index": "ar",
			"isDeleted": false,
			"id": "s60FETfA",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -319.3315443706771,
			"y": -585.0870561635229,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 21.91998291015625,
			"height": 25,
			"seed": 1376201531,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "....",
			"rawText": "....",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "qoWWRta0BUhMQCtlJywWG",
			"originalText": "....",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 3813,
			"versionNonce": 442601340,
			"index": "as",
			"isDeleted": false,
			"id": "BzBfv3VMkhNPjT1yMH_-a",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -523.6989114263495,
			"y": -856.7553452265844,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 140.34953842723706,
			"height": 97.75374191526976,
			"seed": 1313755,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146845,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "-RHac_BzGHkEkXSOB4DX_",
				"focus": -0.8237105130432515,
				"gap": 3.3765183589700882
			},
			"endBinding": {
				"elementId": "vwa3DLAdPOBM4pR3cxNQZ",
				"focus": -0.8441428478625639,
				"gap": 1.0000000000000568
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					140.34953842723706,
					97.75374191526976
				]
			]
		},
		{
			"type": "arrow",
			"version": 3840,
			"versionNonce": 1445519484,
			"index": "at",
			"isDeleted": false,
			"id": "_nYmZ-yQ_1Y7Z7W5C_cbY",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -524.4386988887169,
			"y": -870.3961955903726,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 142.62819172353318,
			"height": 179.89293165514516,
			"seed": 1727780987,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146846,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "-RHac_BzGHkEkXSOB4DX_",
				"focus": -0.919948555903003,
				"gap": 2.6367308966026712
			},
			"endBinding": {
				"elementId": "dKol9XUNmsCMRTMRk1UC1",
				"focus": -0.9033156038725066,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					142.62819172353318,
					179.89293165514516
				]
			]
		},
		{
			"type": "arrow",
			"version": 3893,
			"versionNonce": 319811964,
			"index": "au",
			"isDeleted": false,
			"id": "qowei3lhqCaStuYYmkIb1",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -526.0754297853196,
			"y": -870.0053613575799,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 142.8648982060733,
			"height": 241.68666520535942,
			"seed": 75567387,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146846,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "-RHac_BzGHkEkXSOB4DX_",
				"focus": -0.9272200912413,
				"gap": 1
			},
			"endBinding": {
				"elementId": "rBuVLC_y1zT_WYkPq4_8X",
				"focus": -0.9119018901190757,
				"gap": 1.0000000000000568
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					142.8648982060733,
					241.68666520535942
				]
			]
		},
		{
			"type": "arrow",
			"version": 3980,
			"versionNonce": 1546044028,
			"index": "av",
			"isDeleted": false,
			"id": "n-Nb82_fZhnIwgII1KSqJ",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -525.3358663645168,
			"y": -871.8982653357152,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 142.76433175946468,
			"height": 304.8410665948445,
			"seed": 2048275899,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146847,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "-RHac_BzGHkEkXSOB4DX_",
				"focus": -0.9474792772191518,
				"gap": 1.7395634208027104
			},
			"endBinding": {
				"elementId": "qoWWRta0BUhMQCtlJywWG",
				"focus": -0.9196034295409543,
				"gap": 1.0000000000001137
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					142.76433175946468,
					304.8410665948445
				]
			]
		},
		{
			"type": "rectangle",
			"version": 1138,
			"versionNonce": 501301060,
			"index": "aw",
			"isDeleted": false,
			"id": "MgStu4z-_nCJDBeZLS-m4",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -765.7188821603299,
			"y": -1054.4774351501983,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 479.2588211681988,
			"height": 50.4000244140625,
			"seed": 383632987,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "CMA03osA",
					"type": "text"
				},
				{
					"id": "eE9qfkdi1cLKdbcVK9Vyf",
					"type": "arrow"
				},
				{
					"id": "K4mCBHH3sb-x4c24qkK_b",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1206,
			"versionNonce": 1367389892,
			"index": "ax",
			"isDeleted": false,
			"id": "CMA03osA",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -691.5593507266212,
			"y": -1041.777422943167,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 330.93975830078125,
			"height": 25,
			"seed": 564806395,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "ASTPtr = shared_ptr<BaseAST>",
			"rawText": "ASTPtr = shared_ptr<BaseAST>",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "MgStu4z-_nCJDBeZLS-m4",
			"originalText": "ASTPtr = shared_ptr<BaseAST>",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1513,
			"versionNonce": 754285892,
			"index": "b01",
			"isDeleted": false,
			"id": "M-s1dgk2CDKcuyenuKYNt",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -777.7941680836867,
			"y": -1354.2761402960564,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 158.9333321707589,
			"height": 171.92383975074404,
			"seed": 1897042523,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "tyoaD7O5"
				},
				{
					"id": "vxj9FwK3n2ccoUK_UJ1ZD",
					"type": "arrow"
				}
			],
			"updated": 1714993146690,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1626,
			"versionNonce": 794637508,
			"index": "b02",
			"isDeleted": false,
			"id": "tyoaD7O5",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -757.6274440149089,
			"y": -1343.3142204206843,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 118.59988403320312,
			"height": 150,
			"seed": 1936035579,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "Lexer\n-------\nistream* in\n-------------\nReset()\nNextToken()",
			"rawText": "Lexer\n-------\nistream* in\n-------------\nReset()\nNextToken()",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "M-s1dgk2CDKcuyenuKYNt",
			"originalText": "Lexer\n-------\nistream* in\n-------------\nReset()\nNextToken()",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 4495,
			"versionNonce": 947737468,
			"index": "b07",
			"isDeleted": false,
			"id": "vxj9FwK3n2ccoUK_UJ1ZD",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -564.2281775849872,
			"y": -1263.0471203403947,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 53.216397129054656,
			"height": 1.8464420371092274,
			"seed": 176323989,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146847,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "8mQoUk3UDkLggDBllXmX_",
				"focus": 0.04155280159589184,
				"gap": 1.0000000000003126
			},
			"endBinding": {
				"elementId": "M-s1dgk2CDKcuyenuKYNt",
				"focus": 0.11181266282874111,
				"gap": 1.416261198885934
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-53.216397129054656,
					1.8464420371092274
				]
			]
		},
		{
			"type": "rectangle",
			"version": 1094,
			"versionNonce": 1273878012,
			"index": "b07V",
			"isDeleted": false,
			"id": "fr0yVJQADS20_GXkteM3O",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -367.07792200631707,
			"y": -248.684584445332,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 386.5406754848219,
			"height": 301.6410925071893,
			"seed": 487663227,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "9Fr01rAo",
					"type": "text"
				},
				{
					"id": "kZq1LU8chpNVkX_CmzvZX",
					"type": "arrow"
				},
				{
					"id": "qeaV1uXk3QzmOZ3XwGNC1",
					"type": "arrow"
				},
				{
					"id": "m8hipY5XLyHI1RYOVepQG",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1216,
			"versionNonce": 1345959548,
			"index": "b08",
			"isDeleted": false,
			"id": "9Fr01rAo",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -351.0374426623436,
			"y": -235.36403819173734,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 354.459716796875,
			"height": 275,
			"seed": 50978581,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "Analyzer\n----------\nEvalutor &\n-------------\nReset()\nAnalyzeOn(VarDeclAST) -> TypePtr\nAnalyzeOn(VarDefAST) -> TypePtr\nAnalyzeOn(InitListAST) -> TypePtr\nAnalyzeOn(FuncDeclAST) -> TypePtr\nAnalyzeOn(FuncDefAST) -> TypePtr\nAnalyzeOn(...) -> TypePtr",
			"rawText": "Analyzer\n----------\nEvalutor &\n-------------\nReset()\nAnalyzeOn(VarDeclAST) -> TypePtr\nAnalyzeOn(VarDefAST) -> TypePtr\nAnalyzeOn(InitListAST) -> TypePtr\nAnalyzeOn(FuncDeclAST) -> TypePtr\nAnalyzeOn(FuncDefAST) -> TypePtr\nAnalyzeOn(...) -> TypePtr",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "fr0yVJQADS20_GXkteM3O",
			"originalText": "Analyzer\n----------\nEvalutor &\n-------------\nReset()\nAnalyzeOn(VarDeclAST) -> TypePtr\nAnalyzeOn(VarDefAST) -> TypePtr\nAnalyzeOn(InitListAST) -> TypePtr\nAnalyzeOn(FuncDeclAST) -> TypePtr\nAnalyzeOn(FuncDefAST) -> TypePtr\nAnalyzeOn(...) -> TypePtr",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 2903,
			"versionNonce": 20791620,
			"index": "b09",
			"isDeleted": false,
			"id": "kZq1LU8chpNVkX_CmzvZX",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 278.3610587208647,
			"y": -464.4425772679487,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 266.1595988400838,
			"height": 214.0825650445447,
			"seed": 774740987,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993186841,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "NvEc2cN2tgy59xijwbPbI",
				"gap": 1,
				"focus": -0.24617486425051444
			},
			"endBinding": {
				"elementId": "fr0yVJQADS20_GXkteM3O",
				"gap": 1.6754277780719633,
				"focus": -0.009408628889534648
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-266.1595988400838,
					214.0825650445447
				]
			]
		},
		{
			"type": "rectangle",
			"version": 1275,
			"versionNonce": 1517037820,
			"index": "b09V",
			"isDeleted": false,
			"id": "41KVsx-CcFthFg_BQfiX1",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -803.181917812241,
			"y": -247.50642445018377,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 355.66676839192735,
			"height": 279.6666463216145,
			"seed": 217181141,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "YbvqdIHD",
					"type": "text"
				},
				{
					"id": "Li1CSx_AtPR_JuZu1X5I0",
					"type": "arrow"
				},
				{
					"id": "qeaV1uXk3QzmOZ3XwGNC1",
					"type": "arrow"
				}
			],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1321,
			"versionNonce": 1098230140,
			"index": "b0A",
			"isDeleted": false,
			"id": "YbvqdIHD",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -782.2784042217461,
			"y": -220.17310128937652,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 313.8597412109375,
			"height": 225,
			"seed": 1883527867,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "Evaluator\n========\nReset()\nEvalOn(ValDeclAST&)\n -> std::optional<std::uint32_t>\nEvalOn(VarDefAST&)\n -> std::optional<std::uint32_t>\nEvalOn(...)\n -> std::optional<std::uint32_t>",
			"rawText": "Evaluator\n========\nReset()\nEvalOn(ValDeclAST&)\n -> std::optional<std::uint32_t>\nEvalOn(VarDefAST&)\n -> std::optional<std::uint32_t>\nEvalOn(...)\n -> std::optional<std::uint32_t>",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "41KVsx-CcFthFg_BQfiX1",
			"originalText": "Evaluator\n========\nReset()\nEvalOn(ValDeclAST&)\n -> std::optional<std::uint32_t>\nEvalOn(VarDefAST&)\n -> std::optional<std::uint32_t>\nEvalOn(...)\n -> std::optional<std::uint32_t>",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 3184,
			"versionNonce": 2064171076,
			"index": "b0B",
			"isDeleted": false,
			"id": "Li1CSx_AtPR_JuZu1X5I0",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 203.7041937264254,
			"y": -540.2544963926115,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 647.9843045706166,
			"height": 335.39459654730047,
			"seed": 1445086683,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993186841,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "NvEc2cN2tgy59xijwbPbI",
				"gap": 1,
				"focus": -0.05441858116798799
			},
			"endBinding": {
				"elementId": "41KVsx-CcFthFg_BQfiX1",
				"gap": 3.235038576122463,
				"focus": -0.014949000747861029
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-647.9843045706166,
					335.39459654730047
				]
			]
		},
		{
			"type": "rectangle",
			"version": 972,
			"versionNonce": 1501520068,
			"index": "b0C",
			"isDeleted": false,
			"id": "cFDEILiCIpOzb_NLTgWPs",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 324.2384454181851,
			"y": -284.61385364007924,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 403.6667480468751,
			"height": 307.666727701823,
			"seed": 841581883,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "11Aaf5QW",
					"type": "text"
				},
				{
					"id": "kmeT8UqglS72KOkqYtaR0",
					"type": "arrow"
				},
				{
					"id": "vr2EkD9IRNVZOS9-VHqGR",
					"type": "arrow"
				}
			],
			"updated": 1714993171928,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1051,
			"versionNonce": 132032580,
			"index": "b0D",
			"isDeleted": false,
			"id": "11Aaf5QW",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 336.88196958810704,
			"y": -268.28048978916775,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 378.37969970703125,
			"height": 275,
			"seed": 517678555,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993171928,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "IRBuilder\n-----------\nModule\n-----------\nReset()\nGenerateOn(ValDeclAST&) -> SSAPtr\nGenerateOn(VarDefAST&) -> SSAPtr\nGenerateOn(InitListAST&) -> SSAPtr\nGenerateOn(FuncDeclAST&) -> SSAPtr\nGenerateOn(FuncDefAST&) -> SSAPtr\nGenerateOn(...) -> SSAPtr",
			"rawText": "IRBuilder\n-----------\nModule\n-----------\nReset()\nGenerateOn(ValDeclAST&) -> SSAPtr\nGenerateOn(VarDefAST&) -> SSAPtr\nGenerateOn(InitListAST&) -> SSAPtr\nGenerateOn(FuncDeclAST&) -> SSAPtr\nGenerateOn(FuncDefAST&) -> SSAPtr\nGenerateOn(...) -> SSAPtr",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "cFDEILiCIpOzb_NLTgWPs",
			"originalText": "IRBuilder\n-----------\nModule\n-----------\nReset()\nGenerateOn(ValDeclAST&) -> SSAPtr\nGenerateOn(VarDefAST&) -> SSAPtr\nGenerateOn(InitListAST&) -> SSAPtr\nGenerateOn(FuncDeclAST&) -> SSAPtr\nGenerateOn(FuncDefAST&) -> SSAPtr\nGenerateOn(...) -> SSAPtr",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 2579,
			"versionNonce": 1914735044,
			"index": "b0H",
			"isDeleted": false,
			"id": "qeaV1uXk3QzmOZ3XwGNC1",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -368.07792200631707,
			"y": -107.94246933358477,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 78.43722741399645,
			"height": 2.543477624258628,
			"seed": 327380181,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140598,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "fr0yVJQADS20_GXkteM3O",
				"focus": 0.0240556226630267,
				"gap": 1
			},
			"endBinding": {
				"elementId": "41KVsx-CcFthFg_BQfiX1",
				"focus": -0.05914743511066275,
				"gap": 1.0000000000001705
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-78.43722741399645,
					-2.543477624258628
				]
			]
		},
		{
			"type": "arrow",
			"version": 1901,
			"versionNonce": 1857338692,
			"index": "b0I",
			"isDeleted": false,
			"id": "vr2EkD9IRNVZOS9-VHqGR",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 480.6808330958081,
			"y": -464.4425772679487,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 33.226605258510745,
			"height": 176.32879483555172,
			"seed": 763409013,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993186841,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "NvEc2cN2tgy59xijwbPbI",
				"gap": 1,
				"focus": -0.10624471909322807
			},
			"endBinding": {
				"elementId": "cFDEILiCIpOzb_NLTgWPs",
				"gap": 3.4999287923177462,
				"focus": 0.07574178264596934
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					33.226605258510745,
					176.32879483555172
				]
			]
		},
		{
			"type": "arrow",
			"version": 1164,
			"versionNonce": 689170628,
			"index": "b0K",
			"isDeleted": false,
			"id": "fTOJOO_PWaMccBMl9ilvD",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -219.6801948515856,
			"y": 154.5358419331303,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 129.71649694702978,
			"height": 147.70418035815965,
			"seed": 1208913883,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140598,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "6ayKAEJAXUIdsIayFvP3c",
				"focus": 0.04556096813411833,
				"gap": 2.1949950017838944
			},
			"endBinding": {
				"elementId": "KLDMMt05vWKLJiHSsfHhx",
				"focus": -0.18753156556600806,
				"gap": 2.6996093598472726
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-129.71649694702978,
					147.70418035815965
				]
			]
		},
		{
			"type": "arrow",
			"version": 1827,
			"versionNonce": 723756156,
			"index": "b0L",
			"isDeleted": false,
			"id": "eE9qfkdi1cLKdbcVK9Vyf",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -542.4362378539795,
			"y": -1001.2311217703075,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 76.53047898883989,
			"height": 102.07197494273089,
			"seed": 258514165,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146847,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "MgStu4z-_nCJDBeZLS-m4",
				"focus": -0.01810860434343814,
				"gap": 2.8462889658283075
			},
			"endBinding": {
				"elementId": "-RHac_BzGHkEkXSOB4DX_",
				"focus": -0.24111244605010557,
				"gap": 2.39483681353596
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-76.53047898883989,
					102.07197494273089
				]
			]
		},
		{
			"type": "arrow",
			"version": 1999,
			"versionNonce": 858371452,
			"index": "b0M",
			"isDeleted": false,
			"id": "K4mCBHH3sb-x4c24qkK_b",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -474.816314322784,
			"y": -1131.0808151750764,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 38.457004712584194,
			"height": 73.38802253865106,
			"seed": 1122258843,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993146848,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "8mQoUk3UDkLggDBllXmX_",
				"focus": -0.1233289617245993,
				"gap": 1
			},
			"endBinding": {
				"elementId": "MgStu4z-_nCJDBeZLS-m4",
				"focus": -0.008203586139220223,
				"gap": 3.215357486227049
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-38.457004712584194,
					73.38802253865106
				]
			]
		},
		{
			"type": "arrow",
			"version": 1495,
			"versionNonce": 335251396,
			"index": "b0N",
			"isDeleted": false,
			"id": "m8hipY5XLyHI1RYOVepQG",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -181.59916709357154,
			"y": 53.95650806185742,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 5.367301605237372,
			"height": 46.98431445542641,
			"seed": 1698088789,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993140599,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "fr0yVJQADS20_GXkteM3O",
				"focus": -0.045376805120564634,
				"gap": 1.000000000000142
			},
			"endBinding": {
				"elementId": "6ayKAEJAXUIdsIayFvP3c",
				"focus": -0.02116732339934056,
				"gap": 1.0000000000000568
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-5.367301605237372,
					46.98431445542641
				]
			]
		},
		{
			"type": "rectangle",
			"version": 845,
			"versionNonce": 745956932,
			"index": "b0O",
			"isDeleted": false,
			"id": "IU410t7w945WX38-iW4gs",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 328.35084098956736,
			"y": 83.30832409870442,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 403.66674799999987,
			"height": 50.40002500000003,
			"seed": 1940654107,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "teDgxHZx",
					"type": "text"
				},
				{
					"id": "DZY0ZAy9TOWAcNIMzixaU",
					"type": "arrow"
				},
				{
					"id": "KOLsh1mxyuTpUOKNqrS-N",
					"type": "arrow"
				},
				{
					"id": "kmeT8UqglS72KOkqYtaR0",
					"type": "arrow"
				}
			],
			"updated": 1714993171928,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 903,
			"versionNonce": 1087962564,
			"index": "b0P",
			"isDeleted": false,
			"id": "teDgxHZx",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 386.57432119073917,
			"y": 96.00833659870443,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 287.21978759765625,
			"height": 25,
			"seed": 1456098491,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993171928,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "SSAPtr = shared_ptr<Value>",
			"rawText": "SSAPtr = shared_ptr<Value>",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "IU410t7w945WX38-iW4gs",
			"originalText": "SSAPtr = shared_ptr<Value>",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1572,
			"versionNonce": 416938948,
			"index": "b0U",
			"isDeleted": false,
			"id": "X_aJn8ZzodWd_ScS9Rzd9",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 331.57184117469933,
			"y": 224.831585778267,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 277.39994812011724,
			"height": 350.00000000000006,
			"seed": 1838060795,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "8GrGxVyu"
				},
				{
					"id": "vVXGWjc2mzvqtwy53jj6a",
					"type": "arrow"
				},
				{
					"id": "PaWe34uVs614eeWB2iR-_",
					"type": "arrow"
				},
				{
					"id": "KOLsh1mxyuTpUOKNqrS-N",
					"type": "arrow"
				}
			],
			"updated": 1714993171928,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1842,
			"versionNonce": 1462625092,
			"index": "b0V",
			"isDeleted": false,
			"id": "8GrGxVyu",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 345.65191929969933,
			"y": 237.33158577826703,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 249.2397918701172,
			"height": 325,
			"seed": 310918555,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993171928,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "Value\n------\nTypePtr\nlist<Use *> customer\n-------------------------\nDump(ostream&)\nRunPass(PassBase&)\nGenerateCode(CodeGen&)\nAddUse(Use*)\nRemoveUse(Use*)\nuses() -> list<Use*>\nReplaceBy(SSAPtr&)\nGetPointer() -> SSAPtr",
			"rawText": "Value\n------\nTypePtr\nlist<Use *> customer\n-------------------------\nDump(ostream&)\nRunPass(PassBase&)\nGenerateCode(CodeGen&)\nAddUse(Use*)\nRemoveUse(Use*)\nuses() -> list<Use*>\nReplaceBy(SSAPtr&)\nGetPointer() -> SSAPtr",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "X_aJn8ZzodWd_ScS9Rzd9",
			"originalText": "Value\n------\nTypePtr\nlist<Use *> customer\n-------------------------\nDump(ostream&)\nRunPass(PassBase&)\nGenerateCode(CodeGen&)\nAddUse(Use*)\nRemoveUse(Use*)\nuses() -> list<Use*>\nReplaceBy(SSAPtr&)\nGetPointer() -> SSAPtr",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1802,
			"versionNonce": 1346590916,
			"index": "b0a",
			"isDeleted": false,
			"id": "_MDRdN9gEWE5qF4EqQJkL",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 660.4538584170537,
			"y": 423.9706208547102,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 226.3999629999998,
			"height": 145.99998474121097,
			"seed": 1743696181,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "3aW2p9kc"
				},
				{
					"id": "vVXGWjc2mzvqtwy53jj6a",
					"type": "arrow"
				},
				{
					"id": "DZY0ZAy9TOWAcNIMzixaU",
					"type": "arrow"
				},
				{
					"id": "qCqc8ox6ZImtSbTzY3yC-",
					"type": "arrow"
				}
			],
			"updated": 1714993171929,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1954,
			"versionNonce": 1935908932,
			"index": "b0b",
			"isDeleted": false,
			"id": "3aW2p9kc",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 680.0939186524051,
			"y": 434.4706132253157,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 187.11984252929688,
			"height": 125,
			"seed": 2043462293,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993171929,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "User\n------\nvector<Use>\n---------------\nAddValue(SSAPtr&)",
			"rawText": "User\n------\nvector<Use>\n---------------\nAddValue(SSAPtr&)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "_MDRdN9gEWE5qF4EqQJkL",
			"originalText": "User\n------\nvector<Use>\n---------------\nAddValue(SSAPtr&)",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 4698,
			"versionNonce": 243862780,
			"index": "b0g",
			"isDeleted": false,
			"id": "vVXGWjc2mzvqtwy53jj6a",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 609.9717892948165,
			"y": 467.51192715147334,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 49.482069122237135,
			"height": 16.2347800557028,
			"seed": 2058996789,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993172292,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "X_aJn8ZzodWd_ScS9Rzd9",
				"focus": 0.09906997776274341,
				"gap": 1
			},
			"endBinding": {
				"elementId": "_MDRdN9gEWE5qF4EqQJkL",
				"focus": -0.22012339649459384,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					49.482069122237135,
					16.2347800557028
				]
			]
		},
		{
			"type": "rectangle",
			"version": 2160,
			"versionNonce": 247387844,
			"index": "b0h",
			"isDeleted": false,
			"id": "wJyWDCH0XOWKQh1wWBfym",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 659.3426457600945,
			"y": 170.51147463992095,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 226.39996337890628,
			"height": 222.99995422363278,
			"seed": 620549179,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"type": "text",
					"id": "rEIrR8NK"
				},
				{
					"id": "DZY0ZAy9TOWAcNIMzixaU",
					"type": "arrow"
				},
				{
					"id": "qCqc8ox6ZImtSbTzY3yC-",
					"type": "arrow"
				}
			],
			"updated": 1714993171929,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2483,
			"versionNonce": 297754180,
			"index": "b0i",
			"isDeleted": false,
			"id": "rEIrR8NK",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 672.0527211385124,
			"y": 182.01145175173735,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 200.9798126220703,
			"height": 200,
			"seed": 409769179,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993171929,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "Use\n-----\nSSAPtr\nUser*\n-------\nset_value(SSAPtr&)\nvalue() -> SSAPtr&\nuser() -> User*",
			"rawText": "Use\n-----\nSSAPtr\nUser*\n-------\nset_value(SSAPtr&)\nvalue() -> SSAPtr&\nuser() -> User*",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "wJyWDCH0XOWKQh1wWBfym",
			"originalText": "Use\n-----\nSSAPtr\nUser*\n-------\nset_value(SSAPtr&)\nvalue() -> SSAPtr&\nuser() -> User*",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 2815,
			"versionNonce": 1097595332,
			"index": "b0n",
			"isDeleted": false,
			"id": "PaWe34uVs614eeWB2iR-_",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 330.57184117469933,
			"y": 288.29720135705475,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 320.9446602433925,
			"height": 165.04871466746334,
			"seed": 1796836251,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993171929,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "X_aJn8ZzodWd_ScS9Rzd9",
				"gap": 1,
				"focus": 0.1607876939619604
			},
			"endBinding": {
				"elementId": "6ayKAEJAXUIdsIayFvP3c",
				"gap": 2.164346381832388,
				"focus": -0.8379126720807022
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-320.9446602433925,
					-165.04871466746334
				]
			]
		},
		{
			"type": "arrow",
			"version": 2032,
			"versionNonce": 1907293692,
			"index": "b0o",
			"isDeleted": false,
			"id": "KOLsh1mxyuTpUOKNqrS-N",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 500.5069673896873,
			"y": 134.89584938904142,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 18.42719008995124,
			"height": 86.00186311702845,
			"seed": 574994107,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993172292,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "IU410t7w945WX38-iW4gs",
				"focus": 0.11592431569850935,
				"gap": 1.1875002903369705
			},
			"endBinding": {
				"elementId": "X_aJn8ZzodWd_ScS9Rzd9",
				"focus": -0.15057806822213038,
				"gap": 3.933873272197161
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-18.42719008995124,
					86.00186311702845
				]
			]
		},
		{
			"type": "arrow",
			"version": 3253,
			"versionNonce": 1187819260,
			"index": "b0p",
			"isDeleted": false,
			"id": "DZY0ZAy9TOWAcNIMzixaU",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 707.7685915547547,
			"y": 169.51147463992095,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 4.00829793658454,
			"height": 34.80312554121652,
			"seed": 149315739,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993172292,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "wJyWDCH0XOWKQh1wWBfym",
				"focus": -0.41111332931988903,
				"gap": 1
			},
			"endBinding": {
				"elementId": "IU410t7w945WX38-iW4gs",
				"focus": -0.8330673506853598,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-4.00829793658454,
					-34.80312554121652
				]
			]
		},
		{
			"type": "arrow",
			"version": 1966,
			"versionNonce": 1123164156,
			"index": "b0q",
			"isDeleted": false,
			"id": "kmeT8UqglS72KOkqYtaR0",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 522.5032456647943,
			"y": 24.05287406174375,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 13.146471959320706,
			"height": 58.25545003696067,
			"seed": 280251451,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993172293,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "cFDEILiCIpOzb_NLTgWPs",
				"focus": -0.1326262058556492,
				"gap": 1
			},
			"endBinding": {
				"elementId": "IU410t7w945WX38-iW4gs",
				"focus": -0.12885481172563445,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-13.146471959320706,
					58.25545003696067
				]
			]
		},
		{
			"type": "arrow",
			"version": 4119,
			"versionNonce": 874823804,
			"index": "b0r",
			"isDeleted": false,
			"id": "qCqc8ox6ZImtSbTzY3yC-",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 771.7497055918859,
			"y": 422.4879463988625,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 1.1685414538058012,
			"height": 27.459161473578092,
			"seed": 998295515,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993172293,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "wJyWDCH0XOWKQh1wWBfym",
				"focus": -0.05740802197443745,
				"gap": 28.976517535308744
			},
			"endBinding": {
				"elementId": "wJyWDCH0XOWKQh1wWBfym",
				"gap": 1.517356061730652,
				"focus": 0.057408021974436674
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-1.1685414538058012,
					-27.459161473578092
				]
			]
		},
		{
			"type": "rectangle",
			"version": 2072,
			"versionNonce": 1862437572,
			"index": "b0s",
			"isDeleted": false,
			"id": "DUJG9BQDHnu31Y7FoZzTh",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1105.2491431038582,
			"y": -674.1764202558409,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 287.3485572701898,
			"height": 222.96468243485273,
			"seed": 1276176379,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "q585Vbbf",
					"type": "text"
				},
				{
					"id": "14N8X2502lvatEcDhNmnP",
					"type": "arrow"
				},
				{
					"id": "fV98u6CfqkLjaDxq2kSAj",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2208,
			"versionNonce": 392991300,
			"index": "b0t",
			"isDeleted": false,
			"id": "q585Vbbf",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1125.3835276349491,
			"y": -662.6940790384145,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 247.0797882080078,
			"height": 200,
			"seed": 860369051,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PassManager\n----------------\nPassStage\n-------------\n(S) RegisterPass(string)\nRequiredBy(string, string)\n(S) GetPass(string) -> T\nRunPasses()",
			"rawText": "PassManager\n----------------\nPassStage\n-------------\n(S) RegisterPass(string)\nRequiredBy(string, string)\n(S) GetPass(string) -> T\nRunPasses()",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "DUJG9BQDHnu31Y7FoZzTh",
			"originalText": "PassManager\n----------------\nPassStage\n-------------\n(S) RegisterPass(string)\nRequiredBy(string, string)\n(S) GetPass(string) -> T\nRunPasses()",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1303,
			"versionNonce": 1488932932,
			"index": "b0xV",
			"isDeleted": false,
			"id": "JyCgeUOGoeif1VuN0-Y13",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1113.650784780555,
			"y": -240.12705870286527,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 284.89127373335845,
			"height": 410,
			"seed": 1396183893,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "Mah5JKJ2",
					"type": "text"
				},
				{
					"id": "W5iZHquc8Qpweq-zkAN08",
					"type": "arrow"
				},
				{
					"id": "nR3a-XWdFV0CIEecuQ-Cp",
					"type": "arrow"
				},
				{
					"id": "_CqOsasvINRgsggW5gi_T",
					"type": "arrow"
				},
				{
					"id": "q0u09bvZkP0Q2uINElJZF",
					"type": "arrow"
				},
				{
					"id": "1hklZfz0oMdWVekYDMJ87",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1527,
			"versionNonce": 141862852,
			"index": "b0y",
			"isDeleted": false,
			"id": "Mah5JKJ2",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1135.4865202190117,
			"y": -222.62705870286527,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 241.2198028564453,
			"height": 375,
			"seed": 1986562875,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PassBase\n========\nIsModulePass()\nRunOnModule()\nIsFunctionPass()\nRunOnFunction(FuncPtr&)\nIsBlockPass()\nRunOnBlock(BlockPtr&)\nInitialize()\nCleanUp()\nRunOn(LoadSSA&)\nRunOn(StoreSSA&)\nRunOn(AccessSSA&)\nRunOn(BinarySSA&)\nRunOn(....&)",
			"rawText": "PassBase\n========\nIsModulePass()\nRunOnModule()\nIsFunctionPass()\nRunOnFunction(FuncPtr&)\nIsBlockPass()\nRunOnBlock(BlockPtr&)\nInitialize()\nCleanUp()\nRunOn(LoadSSA&)\nRunOn(StoreSSA&)\nRunOn(AccessSSA&)\nRunOn(BinarySSA&)\nRunOn(....&)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "JyCgeUOGoeif1VuN0-Y13",
			"originalText": "PassBase\n========\nIsModulePass()\nRunOnModule()\nIsFunctionPass()\nRunOnFunction(FuncPtr&)\nIsBlockPass()\nRunOnBlock(BlockPtr&)\nInitialize()\nCleanUp()\nRunOn(LoadSSA&)\nRunOn(StoreSSA&)\nRunOn(AccessSSA&)\nRunOn(BinarySSA&)\nRunOn(....&)",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1993,
			"versionNonce": 787285188,
			"index": "b0z",
			"isDeleted": false,
			"id": "4wwVv40r9EKRVLda1sbLc",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1109.2063275786063,
			"y": -366.1555271201039,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 282.62834243032296,
			"height": 67.11113823784717,
			"seed": 1387845813,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "Mj7CSKoe",
					"type": "text"
				},
				{
					"id": "1hklZfz0oMdWVekYDMJ87",
					"type": "arrow"
				},
				{
					"id": "8IpoPbq9n3mzMqMWgba8V",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2018,
			"versionNonce": 670551108,
			"index": "b10",
			"isDeleted": false,
			"id": "Mj7CSKoe",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1138.3505998069513,
			"y": -357.5999580011803,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 224.3397979736328,
			"height": 50,
			"seed": 1743125013,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PassPtr =\nunique_ptr<PassBase>",
			"rawText": "PassPtr = unique_ptr<PassBase>",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "4wwVv40r9EKRVLda1sbLc",
			"originalText": "PassPtr = unique_ptr<PassBase>",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1173,
			"versionNonce": 1697809092,
			"index": "b14V",
			"isDeleted": false,
			"id": "76gv672t2HBIV8fQfOOLc",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1484.538476958213,
			"y": -222.74311785629584,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 189.74284467492626,
			"height": 44.496183102177156,
			"seed": 2033079643,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "RfLrTVlL",
					"type": "text"
				},
				{
					"id": "W5iZHquc8Qpweq-zkAN08",
					"type": "arrow"
				},
				{
					"id": "q0u09bvZkP0Q2uINElJZF",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1184,
			"versionNonce": 886934084,
			"index": "b15",
			"isDeleted": false,
			"id": "RfLrTVlL",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1522.5999551428442,
			"y": -212.99502630520726,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 113.61988830566406,
			"height": 25,
			"seed": 1527598037,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "ModulePass",
			"rawText": "ModulePass",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "76gv672t2HBIV8fQfOOLc",
			"originalText": "ModulePass",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1205,
			"versionNonce": 1475004740,
			"index": "b16",
			"isDeleted": false,
			"id": "N7ro-HFfV3t5WvT3Z74UK",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1487.8027512435626,
			"y": -150.1426327259585,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 189.74284467492626,
			"height": 44.496183102177156,
			"seed": 396536571,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "s9xIL8lA",
					"type": "text"
				},
				{
					"id": "W5iZHquc8Qpweq-zkAN08",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1225,
			"versionNonce": 1707671748,
			"index": "b17",
			"isDeleted": false,
			"id": "s9xIL8lA",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1519.3742315644242,
			"y": -140.39454117486991,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 126.59988403320312,
			"height": 25,
			"seed": 1302959003,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "FunctionPass",
			"rawText": "FunctionPass",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "N7ro-HFfV3t5WvT3Z74UK",
			"originalText": "FunctionPass",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1274,
			"versionNonce": 1212850116,
			"index": "b1C",
			"isDeleted": false,
			"id": "Xllv3s_PTY4IP3r1oqkkD",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1489.0458390340925,
			"y": -74.35571447135658,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 189.74284467492626,
			"height": 44.496183102177156,
			"seed": 1836592245,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "H6wHZt3e",
					"type": "text"
				},
				{
					"id": "_CqOsasvINRgsggW5gi_T",
					"type": "arrow"
				},
				{
					"id": "nR3a-XWdFV0CIEecuQ-Cp",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1283,
			"versionNonce": 417990468,
			"index": "b1E",
			"isDeleted": false,
			"id": "H6wHZt3e",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1534.4473059272198,
			"y": -64.607622920268,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 98.93991088867188,
			"height": 25,
			"seed": 1594152405,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "BlockPass",
			"rawText": "BlockPass",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "Xllv3s_PTY4IP3r1oqkkD",
			"originalText": "BlockPass",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 1301,
			"versionNonce": 918292036,
			"index": "b1F",
			"isDeleted": false,
			"id": "Caq9Z3_AI8IjEfcF8QcQq",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1488.1977918781733,
			"y": 3.0868406053738227,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 189.74284467492626,
			"height": 44.496183102177156,
			"seed": 553123963,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "ocJm321F",
					"type": "text"
				},
				{
					"id": "_CqOsasvINRgsggW5gi_T",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1323,
			"versionNonce": 829070788,
			"index": "b1G",
			"isDeleted": false,
			"id": "ocJm321F",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1530.619270673156,
			"y": 12.8349321564624,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 104.89988708496094,
			"height": 25,
			"seed": 2092448027,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "HelperPass",
			"rawText": "HelperPass",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "Caq9Z3_AI8IjEfcF8QcQq",
			"originalText": "HelperPass",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 7229,
			"versionNonce": 1623247612,
			"index": "b1H",
			"isDeleted": false,
			"id": "q0u09bvZkP0Q2uINElJZF",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1399.5420585139134,
			"y": -177.83865544146067,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 82.89493054245281,
			"height": 19.735536938658868,
			"seed": 987529429,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993180534,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "JyCgeUOGoeif1VuN0-Y13",
				"focus": -0.45439165327816716,
				"gap": 1
			},
			"endBinding": {
				"elementId": "76gv672t2HBIV8fQfOOLc",
				"focus": 0.4497910769115058,
				"gap": 2.1014879018468946
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					82.89493054245281,
					-19.735536938658868
				]
			]
		},
		{
			"type": "arrow",
			"version": 7309,
			"versionNonce": 193936380,
			"index": "b1I",
			"isDeleted": false,
			"id": "W5iZHquc8Qpweq-zkAN08",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1399.5420585139138,
			"y": -139.1853786982532,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 87.26069272964878,
			"height": 12.803540439570725,
			"seed": 2091406619,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993180534,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "JyCgeUOGoeif1VuN0-Y13",
				"focus": -0.5538085623328971,
				"gap": 1.0000000000002274
			},
			"endBinding": {
				"elementId": "N7ro-HFfV3t5WvT3Z74UK",
				"focus": -0.430754522497609,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					87.26069272964878,
					12.803540439570725
				]
			]
		},
		{
			"type": "arrow",
			"version": 7370,
			"versionNonce": 943025404,
			"index": "b1J",
			"isDeleted": false,
			"id": "nR3a-XWdFV0CIEecuQ-Cp",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1399.5420585139138,
			"y": -106.21048906601374,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 88.50378052017868,
			"height": 52.28523546301744,
			"seed": 875007957,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993180534,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "JyCgeUOGoeif1VuN0-Y13",
				"focus": -0.5389081639175184,
				"gap": 1.0000000000002274
			},
			"endBinding": {
				"elementId": "Xllv3s_PTY4IP3r1oqkkD",
				"focus": -0.7001735062803344,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					88.50378052017868,
					52.28523546301744
				]
			]
		},
		{
			"type": "arrow",
			"version": 7441,
			"versionNonce": 600006140,
			"index": "b1K",
			"isDeleted": false,
			"id": "_CqOsasvINRgsggW5gi_T",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1399.7235603646106,
			"y": -64.62844784690384,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 87.4742315135627,
			"height": 91.78187547020015,
			"seed": 899449211,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993180534,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "JyCgeUOGoeif1VuN0-Y13",
				"focus": -0.508382432587237,
				"gap": 1.1815018506970318
			},
			"endBinding": {
				"elementId": "Caq9Z3_AI8IjEfcF8QcQq",
				"focus": -0.8408726188953783,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					87.4742315135627,
					91.78187547020015
				]
			]
		},
		{
			"type": "arrow",
			"version": 4951,
			"versionNonce": 122228476,
			"index": "b1L",
			"isDeleted": false,
			"id": "1hklZfz0oMdWVekYDMJ87",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1246.6969860886525,
			"y": -296.93894794474977,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 32.17113664165208,
			"height": 54.134180191928635,
			"seed": 1323659829,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993180534,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "4wwVv40r9EKRVLda1sbLc",
				"focus": -0.10771271492112336,
				"gap": 2.1054409375069554
			},
			"endBinding": {
				"elementId": "JyCgeUOGoeif1VuN0-Y13",
				"focus": -0.624315251589666,
				"gap": 2.6777090499558653
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-32.17113664165208,
					54.134180191928635
				]
			]
		},
		{
			"type": "rectangle",
			"version": 2015,
			"versionNonce": 1432257092,
			"index": "b1LV",
			"isDeleted": false,
			"id": "xUuojcTz9vlXifLa-1p8e",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1454.0507028318443,
			"y": -369.76937062327215,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 281.48541097859936,
			"height": 85,
			"seed": 1321947611,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "mAfzGYdg",
					"type": "text"
				},
				{
					"id": "2QJUMGl5lezk4qQ0HAIeT",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1969,
			"versionNonce": 1314757060,
			"index": "b1M",
			"isDeleted": false,
			"id": "mAfzGYdg",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1481.5434998738783,
			"y": -364.76937062327215,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 226.49981689453125,
			"height": 75,
			"seed": 1006923413,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PassStage ::= PreOpt \n| Promote | Opt \n| Demote | PostOpt",
			"rawText": "PassStage ::= PreOpt \n| Promote | Opt \n| Demote | PostOpt",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "xUuojcTz9vlXifLa-1p8e",
			"originalText": "PassStage ::= PreOpt \n| Promote | Opt \n| Demote | PostOpt",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 2199,
			"versionNonce": 1162672324,
			"index": "b1N",
			"isDeleted": false,
			"id": "d9THKahjdTkRp0z99q9J7",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1474.3545358140477,
			"y": -718.1147513762776,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 292.96994725139643,
			"height": 277.98843078474044,
			"seed": 972364283,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "AIAgaLDg",
					"type": "text"
				},
				{
					"id": "8IpoPbq9n3mzMqMWgba8V",
					"type": "arrow"
				},
				{
					"id": "2QJUMGl5lezk4qQ0HAIeT",
					"type": "arrow"
				},
				{
					"id": "14N8X2502lvatEcDhNmnP",
					"type": "arrow"
				}
			],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2481,
			"versionNonce": 1446592580,
			"index": "b1O",
			"isDeleted": false,
			"id": "AIAgaLDg",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1491.7496199133789,
			"y": -704.1205359839073,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 258.1797790527344,
			"height": 250,
			"seed": 2044076699,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PassInfo\n-----------\nPassPtr\nPassStage\n-------------\nRequires() -> PassInfo&\nInvalidates()-> PassInfo&\npass() -> PassPtr&\nname() -> string\nstages() -> PassStage",
			"rawText": "PassInfo\n-----------\nPassPtr\nPassStage\n-------------\nRequires() -> PassInfo&\nInvalidates()-> PassInfo&\npass() -> PassPtr&\nname() -> string\nstages() -> PassStage",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "d9THKahjdTkRp0z99q9J7",
			"originalText": "PassInfo\n-----------\nPassPtr\nPassStage\n-------------\nRequires() -> PassInfo&\nInvalidates()-> PassInfo&\npass() -> PassPtr&\nname() -> string\nstages() -> PassStage",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 5296,
			"versionNonce": 399933436,
			"index": "b1R",
			"isDeleted": false,
			"id": "8IpoPbq9n3mzMqMWgba8V",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1473.3545358140477,
			"y": -449.7818044624644,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 156.95167061301936,
			"height": 82.61339247696105,
			"seed": 822414587,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993180535,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "d9THKahjdTkRp0z99q9J7",
				"focus": -0.23928110357464155,
				"gap": 1.0000000000001137
			},
			"endBinding": {
				"elementId": "4wwVv40r9EKRVLda1sbLc",
				"focus": 0.001014647516366207,
				"gap": 1.0128848653994282
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-156.95167061301936,
					82.61339247696105
				]
			]
		},
		{
			"type": "arrow",
			"version": 3201,
			"versionNonce": 232029764,
			"index": "b1S",
			"isDeleted": false,
			"id": "nqhZdoHGuSIkgxgOwyRde",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 306.48942833086414,
			"y": -870.8061914369828,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 60.20845885754116,
			"height": 188.4434283899534,
			"seed": 1790403387,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993186841,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "NvEc2cN2tgy59xijwbPbI",
				"gap": 1,
				"focus": -0.16013515354256747
			},
			"endBinding": {
				"elementId": "n_to7bAOznpoCa-2oAMtW",
				"gap": 3.8626327942517946,
				"focus": -0.11831155825556948
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-60.20845885754116,
					-188.4434283899534
				]
			]
		},
		{
			"type": "arrow",
			"version": 5848,
			"versionNonce": 108769532,
			"index": "b1T",
			"isDeleted": false,
			"id": "2QJUMGl5lezk4qQ0HAIeT",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1565.1166823531266,
			"y": -439.126320591537,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 1.6431574049345272,
			"height": 67.93213323509963,
			"seed": 89399483,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993180535,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "d9THKahjdTkRp0z99q9J7",
				"focus": 0.349267035337866,
				"gap": 1.0000000000000568
			},
			"endBinding": {
				"elementId": "xUuojcTz9vlXifLa-1p8e",
				"focus": -0.22841352556527844,
				"gap": 1.424816733165244
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-1.6431574049345272,
					67.93213323509963
				]
			]
		},
		{
			"type": "arrow",
			"version": 5153,
			"versionNonce": 4760060,
			"index": "b1U",
			"isDeleted": false,
			"id": "14N8X2502lvatEcDhNmnP",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1394.6973265192753,
			"y": -592.9689917069246,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 78.65720929477243,
			"height": 13.173830413846304,
			"seed": 711581173,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993180535,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "DUJG9BQDHnu31Y7FoZzTh",
				"focus": -0.4034787054183143,
				"gap": 2.0996261452273757
			},
			"endBinding": {
				"elementId": "d9THKahjdTkRp0z99q9J7",
				"focus": -0.14692739367403276,
				"gap": 1.0000000000001137
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					78.65720929477243,
					13.173830413846304
				]
			]
		},
		{
			"type": "rectangle",
			"version": 1756,
			"versionNonce": 857163844,
			"index": "b1V",
			"isDeleted": false,
			"id": "n_to7bAOznpoCa-2oAMtW",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 33.95924985783665,
			"y": -1343.3683294133875,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 287.9682597643769,
			"height": 280.2560767921995,
			"seed": 107529115,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "VutfA4EI",
					"type": "text"
				},
				{
					"id": "0cgS0w4G6wqhQ6rYpn_fb",
					"type": "arrow"
				},
				{
					"id": "s4rfL11kaQdEeDLS3gHxl",
					"type": "arrow"
				},
				{
					"id": "nqhZdoHGuSIkgxgOwyRde",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 1985,
			"versionNonce": 1158520772,
			"index": "b1W",
			"isDeleted": false,
			"id": "VutfA4EI",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 54.05347953250558,
			"y": -1328.2402910172877,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 247.77980041503906,
			"height": 250,
			"seed": 2036570171,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "CodeGen\n(CodeGenInterface)\n================\nGenerateOn(LoadSSA&)\nGenerateOn(StoreSSA&)\nGenerateOn(AccessSSA&)\nGenerateOn(BinarySSA&)\nGenerateOn(UnarySSA&)\nGenerateOn(...)\nDump(ostream&)",
			"rawText": "CodeGen\n(CodeGenInterface)\n================\nGenerateOn(LoadSSA&)\nGenerateOn(StoreSSA&)\nGenerateOn(AccessSSA&)\nGenerateOn(BinarySSA&)\nGenerateOn(UnarySSA&)\nGenerateOn(...)\nDump(ostream&)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "n_to7bAOznpoCa-2oAMtW",
			"originalText": "CodeGen\n(CodeGenInterface)\n================\nGenerateOn(LoadSSA&)\nGenerateOn(StoreSSA&)\nGenerateOn(AccessSSA&)\nGenerateOn(BinarySSA&)\nGenerateOn(UnarySSA&)\nGenerateOn(...)\nDump(ostream&)",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 3810,
			"versionNonce": 1439775812,
			"index": "b1Z",
			"isDeleted": false,
			"id": "fV98u6CfqkLjaDxq2kSAj",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 629.9952661520022,
			"y": -628.6549632756333,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 474.2538769518558,
			"height": 30.680700593876395,
			"seed": 1369944603,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993186841,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "NvEc2cN2tgy59xijwbPbI",
				"gap": 1.000128933034091,
				"focus": 0.11543788715076175
			},
			"endBinding": {
				"elementId": "DUJG9BQDHnu31Y7FoZzTh",
				"gap": 1.000000000000341,
				"focus": 0.21461729809932314
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					474.2538769518558,
					30.680700593876395
				]
			]
		},
		{
			"type": "arrow",
			"version": 1178,
			"versionNonce": 692092740,
			"index": "b1b",
			"isDeleted": false,
			"id": "LntipuYUKtMEDSxIUlfLX",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 202.58822149881257,
			"y": -793.500521010984,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 500.14356912849377,
			"height": 367.4934669884427,
			"seed": 1555564795,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993186841,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "NvEc2cN2tgy59xijwbPbI",
				"focus": -0.08733906479239495,
				"gap": 2.115972227612815
			},
			"endBinding": {
				"elementId": "8mQoUk3UDkLggDBllXmX_",
				"focus": 0.013705635670643824,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-500.14356912849377,
					-367.4934669884427
				]
			]
		},
		{
			"type": "rectangle",
			"version": 2101,
			"versionNonce": 1010648388,
			"index": "b1c",
			"isDeleted": false,
			"id": "hfAWLcpPg1yCAtuOO5iyu",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 147.97036188505285,
			"y": -1719.5552141044257,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 253.88542587239357,
			"height": 152.16412514689253,
			"seed": 305568475,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "cNs2rfHK",
					"type": "text"
				},
				{
					"id": "0cgS0w4G6wqhQ6rYpn_fb",
					"type": "arrow"
				},
				{
					"id": "s4rfL11kaQdEeDLS3gHxl",
					"type": "arrow"
				},
				{
					"id": "JttRgOw6rwbvLTKzRGBV_",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2395,
			"versionNonce": 309066948,
			"index": "b1d",
			"isDeleted": false,
			"id": "cNs2rfHK",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 166.97317919136682,
			"y": -1705.9731515309793,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 215.87979125976562,
			"height": 125,
			"seed": 1408534395,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "AsmCodeGen\n---------------\nArchInfoPtr\n--------------\nSetTargetArch(string)",
			"rawText": "AsmCodeGen\n---------------\nArchInfoPtr\n--------------\nSetTargetArch(string)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "hfAWLcpPg1yCAtuOO5iyu",
			"originalText": "AsmCodeGen\n---------------\nArchInfoPtr\n--------------\nSetTargetArch(string)",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 813,
			"versionNonce": 840860484,
			"index": "b1hV",
			"isDeleted": false,
			"id": "u2z3GOomihJ0RAP9QlSpY",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 411.2483577421675,
			"y": -1547.7143257246692,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 309.52323894066694,
			"height": 73.63907759427855,
			"seed": 1832599669,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "oDi28pe0",
					"type": "text"
				},
				{
					"id": "3bu11R2F28og8nJ4RSjiU",
					"type": "arrow"
				},
				{
					"id": "uDuUQ-1x4qx1jDpJhLn5p",
					"type": "arrow"
				},
				{
					"id": "JttRgOw6rwbvLTKzRGBV_",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 848,
			"versionNonce": 1970633412,
			"index": "b1i",
			"isDeleted": false,
			"id": "oDi28pe0",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 433.29009806211036,
			"y": -1535.8947869275298,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 265.43975830078125,
			"height": 50,
			"seed": 1885337627,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "ArchInfoPtr =\nshared_ptr<ArchInfoBase>",
			"rawText": "ArchInfoPtr = shared_ptr<ArchInfoBase>",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "u2z3GOomihJ0RAP9QlSpY",
			"originalText": "ArchInfoPtr = shared_ptr<ArchInfoBase>",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 2174,
			"versionNonce": 550500548,
			"index": "b1j",
			"isDeleted": false,
			"id": "ZvwU6Ai4YxjF-H_NQAVuv",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 448.27455199434826,
			"y": -1419.6180570486943,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 253.88542587239357,
			"height": 73.89601506444957,
			"seed": 1822470901,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "fClj3OSQ",
					"type": "text"
				},
				{
					"id": "3bu11R2F28og8nJ4RSjiU",
					"type": "arrow"
				},
				{
					"id": "wCrH5dbjpCcWd6VwZS_UZ",
					"type": "arrow"
				},
				{
					"id": "oLkIzyZ9Re3ev6-fK88CS",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2473,
			"versionNonce": 1230782532,
			"index": "b1k",
			"isDeleted": false,
			"id": "fClj3OSQ",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 509.037318031131,
			"y": -1407.6700495164694,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 132.35989379882812,
			"height": 50,
			"seed": 609782869,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "ArchInfoBase\n",
			"rawText": "ArchInfoBase\n",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "ZvwU6Ai4YxjF-H_NQAVuv",
			"originalText": "ArchInfoBase\n",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 2287,
			"versionNonce": 1449655876,
			"index": "b1p",
			"isDeleted": false,
			"id": "Ucp4PHeRFHIOl7UFudxkh",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 429.75679873481715,
			"y": -1981.1225230078157,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 330.6501711404492,
			"height": 185,
			"seed": 2030010581,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "3yyDoZpW",
					"type": "text"
				},
				{
					"id": "QOkMH4ZftvtJYwjsB7t-Q",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2728,
			"versionNonce": 1758959044,
			"index": "b1q",
			"isDeleted": false,
			"id": "3yyDoZpW",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 439.1120051546511,
			"y": -1963.6225230078157,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 311.93975830078125,
			"height": 150,
			"seed": 996318773,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "ArchManager\n---------------\nunord_map<str, ArchEntry>\n--------------------------------\n(S) RegisterArch(name, entry)\n(S) GetArch(name)->ArchInfoPtr",
			"rawText": "ArchManager\n---------------\nunord_map<str, ArchEntry>\n--------------------------------\n(S) RegisterArch(name, entry)\n(S) GetArch(name)->ArchInfoPtr",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "Ucp4PHeRFHIOl7UFudxkh",
			"originalText": "ArchManager\n---------------\nunord_map<str, ArchEntry>\n--------------------------------\n(S) RegisterArch(name, entry)\n(S) GetArch(name)->ArchInfoPtr",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 2384,
			"versionNonce": 1316484292,
			"index": "b1v",
			"isDeleted": false,
			"id": "O8AVatz32bIlGM517mkQS",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 434.11674008867953,
			"y": -1748.3784378907135,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 273.11170995678316,
			"height": 151.6044301833481,
			"seed": 779391125,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "ABNwInpM",
					"type": "text"
				},
				{
					"id": "QOkMH4ZftvtJYwjsB7t-Q",
					"type": "arrow"
				},
				{
					"id": "uDuUQ-1x4qx1jDpJhLn5p",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2751,
			"versionNonce": 2024062020,
			"index": "b1w",
			"isDeleted": false,
			"id": "ABNwInpM",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 449.83270554070396,
			"y": -1735.0762227990394,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 241.67977905273438,
			"height": 125,
			"seed": 1730131445,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "ArchEntry\n------------\nArchInfoPtr\n--------------\narch_info()->ArchInfoPtr",
			"rawText": "ArchEntry\n------------\nArchInfoPtr\n--------------\narch_info()->ArchInfoPtr",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "O8AVatz32bIlGM517mkQS",
			"originalText": "ArchEntry\n------------\nArchInfoPtr\n--------------\narch_info()->ArchInfoPtr",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 2200,
			"versionNonce": 706816892,
			"index": "b27",
			"isDeleted": false,
			"id": "3bu11R2F28og8nJ4RSjiU",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 570.6869600050713,
			"y": -1473.0752481303905,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 3.374586273468026,
			"height": 51.978803860666176,
			"seed": 421986491,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "u2z3GOomihJ0RAP9QlSpY",
				"focus": -0.01413694319581813,
				"gap": 1.0000000000001137
			},
			"endBinding": {
				"elementId": "ZvwU6Ai4YxjF-H_NQAVuv",
				"focus": 0.010352544968995833,
				"gap": 1.4783872210299478
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					3.374586273468026,
					51.978803860666176
				]
			]
		},
		{
			"type": "arrow",
			"version": 2216,
			"versionNonce": 934378620,
			"index": "b28",
			"isDeleted": false,
			"id": "QOkMH4ZftvtJYwjsB7t-Q",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 583.0849500620077,
			"y": -1795.1225230078157,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 6.366673737943188,
			"height": 42.44264116286445,
			"seed": 2101279547,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "Ucp4PHeRFHIOl7UFudxkh",
				"focus": -0.011320699804960796,
				"gap": 1
			},
			"endBinding": {
				"elementId": "O8AVatz32bIlGM517mkQS",
				"focus": -0.0403604768022938,
				"gap": 4.301443954237811
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-6.366673737943188,
					42.44264116286445
				]
			]
		},
		{
			"type": "arrow",
			"version": 2172,
			"versionNonce": 673287548,
			"index": "b29",
			"isDeleted": false,
			"id": "uDuUQ-1x4qx1jDpJhLn5p",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 580.257470218579,
			"y": -1595.7740077073654,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 16.122522046934705,
			"height": 46.94230069201035,
			"seed": 1595176021,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "O8AVatz32bIlGM517mkQS",
				"focus": -0.22118709432542863,
				"gap": 1
			},
			"endBinding": {
				"elementId": "u2z3GOomihJ0RAP9QlSpY",
				"focus": -0.08903198713676076,
				"gap": 1.117381290686012
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-16.122522046934705,
					46.94230069201035
				]
			]
		},
		{
			"type": "arrow",
			"version": 2189,
			"versionNonce": 377577084,
			"index": "b2A",
			"isDeleted": false,
			"id": "0cgS0w4G6wqhQ6rYpn_fb",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 217.44213856827827,
			"y": -1344.368329413388,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 19.005804586628358,
			"height": 219.31016637199195,
			"seed": 1557941595,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "n_to7bAOznpoCa-2oAMtW",
				"focus": 0.33132561197380417,
				"gap": 1.0000000000004547
			},
			"endBinding": {
				"elementId": "hfAWLcpPg1yCAtuOO5iyu",
				"focus": 0.6244893673214775,
				"gap": 3.7125931721533334
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					-19.005804586628358,
					-219.31016637199195
				]
			]
		},
		{
			"type": "rectangle",
			"version": 2335,
			"versionNonce": 392425668,
			"index": "b2B",
			"isDeleted": false,
			"id": "MoxJhOQvpiGr8x86maOiO",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 19.748418773363937,
			"y": -1925.8042276477663,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 253.88542587239357,
			"height": 149.71642543736561,
			"seed": 1425679387,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "z46O2BE1",
					"type": "text"
				},
				{
					"id": "s4rfL11kaQdEeDLS3gHxl",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2669,
			"versionNonce": 984692804,
			"index": "b2C",
			"isDeleted": false,
			"id": "z46O2BE1",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 60.381279109463065,
			"y": -1913.4460149290835,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 172.6197052001953,
			"height": 125,
			"seed": 536144059,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "CCodeGen\n------------\nvector<TypeInfo>\n---------------------\nReset()",
			"rawText": "CCodeGen\n------------\nvector<TypeInfo>\n---------------------\nReset()",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "MoxJhOQvpiGr8x86maOiO",
			"originalText": "CCodeGen\n------------\nvector<TypeInfo>\n---------------------\nReset()",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 2627,
			"versionNonce": 434171772,
			"index": "b2H",
			"isDeleted": false,
			"id": "s4rfL11kaQdEeDLS3gHxl",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 157.89455081169325,
			"y": -1344.3683294133875,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 96.88051347309654,
			"height": 430.71947279701317,
			"seed": 1669287349,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "n_to7bAOznpoCa-2oAMtW",
				"focus": 0.06663543970122054,
				"gap": 1
			},
			"endBinding": {
				"elementId": "MoxJhOQvpiGr8x86maOiO",
				"focus": 0.7145598213537377,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					-96.88051347309654,
					-430.71947279701317
				]
			]
		},
		{
			"type": "rectangle",
			"version": 2143,
			"versionNonce": 1423142596,
			"index": "b2I",
			"isDeleted": false,
			"id": "tWQWrOL3VIGihn9_VvWQy",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1125.5876740620538,
			"y": -1307.0861845675727,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 316.9557528163835,
			"height": 67.11113823784717,
			"seed": 1234519748,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "rvK6YkQw",
					"type": "text"
				},
				{
					"id": "F3YDUHQi7dEbPTPo5UoOU",
					"type": "arrow"
				},
				{
					"id": "ZXVR4jzNSpsYJXFWkoE5i",
					"type": "arrow"
				},
				{
					"id": "tJj_UJ_XLzJzKTfElSAC2",
					"type": "arrow"
				},
				{
					"id": "sqOHX9JIYY2Od7Z1BhcG2",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 2165,
			"versionNonce": 1501623876,
			"index": "b2J",
			"isDeleted": false,
			"id": "rvK6YkQw",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1149.1756578921206,
			"y": -1298.530615448649,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 269.77978515625,
			"height": 50,
			"seed": 138923588,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PassPtr =\nunique_ptr<PassInterface>",
			"rawText": "PassPtr = unique_ptr<PassInterface>",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "tWQWrOL3VIGihn9_VvWQy",
			"originalText": "PassPtr = unique_ptr<PassInterface>",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 510,
			"versionNonce": 2102037444,
			"index": "b2JV",
			"isDeleted": false,
			"id": "u6Ml52EOVnX9svEig4o1c",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1107.2097911524672,
			"y": -1172.3638295111562,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 203.03910424599005,
			"height": 125.72233038379242,
			"seed": 210276476,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "5C3i3LbR",
					"type": "text"
				},
				{
					"id": "F3YDUHQi7dEbPTPo5UoOU",
					"type": "arrow"
				},
				{
					"id": "4Pvgtm_7EgcD_j3fug-ma",
					"type": "arrow"
				},
				{
					"id": "uS4iWpSacoss4I2Lc2_0l",
					"type": "arrow"
				},
				{
					"id": "o9Rd0qTnRdZlJaSGawG2g",
					"type": "arrow"
				},
				{
					"id": "Ecd7Up5awpPZyWz02huaG",
					"type": "arrow"
				},
				{
					"id": "sqOHX9JIYY2Od7Z1BhcG2",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 553,
			"versionNonce": 2131522372,
			"index": "b2K",
			"isDeleted": false,
			"id": "5C3i3LbR",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1132.7094076675521,
			"y": -1159.50266431926,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 152.0398712158203,
			"height": 100,
			"seed": 338003524,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "PassInterface\n============\nRunOn(OprPtr&,\nInstPtrList&)",
			"rawText": "PassInterface\n============\nRunOn(OprPtr&,\nInstPtrList&)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "u6Ml52EOVnX9svEig4o1c",
			"originalText": "PassInterface\n============\nRunOn(OprPtr&,\nInstPtrList&)",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 1211,
			"versionNonce": 1162887292,
			"index": "b2L",
			"isDeleted": false,
			"id": "F3YDUHQi7dEbPTPo5UoOU",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1272.929382208796,
			"y": -1238.9750463297255,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 47.99432220739914,
			"height": 65.61121681856912,
			"seed": 343143292,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "tWQWrOL3VIGihn9_VvWQy",
				"focus": -0.0772636927512466,
				"gap": 1
			},
			"endBinding": {
				"elementId": "u6Ml52EOVnX9svEig4o1c",
				"focus": -0.20683383310620423,
				"gap": 1.0000000000001137
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-47.99432220739914,
					65.61121681856912
				]
			]
		},
		{
			"type": "rectangle",
			"version": 542,
			"versionNonce": 1760528324,
			"index": "b2LV",
			"isDeleted": false,
			"id": "0sYJP8utj-5zfL-vGfTM7",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1498.9107522842132,
			"y": -1297.0579540531041,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 240.8957189919706,
			"height": 42.88364785073386,
			"seed": 501838204,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "61leLIGZ",
					"type": "text"
				},
				{
					"id": "4Pvgtm_7EgcD_j3fug-ma",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 554,
			"versionNonce": 615640900,
			"index": "b2M",
			"isDeleted": false,
			"id": "61leLIGZ",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1520.2286984501204,
			"y": -1288.1161301277373,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 198.25982666015625,
			"height": 25,
			"seed": 850455420,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "BranchCombiningPass",
			"rawText": "BranchCombiningPass",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "0sYJP8utj-5zfL-vGfTM7",
			"originalText": "BranchCombiningPass",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 505,
			"versionNonce": 262794820,
			"index": "b2MV",
			"isDeleted": false,
			"id": "avDZFZVekTYd9kbCMaEVq",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1501.5306305887846,
			"y": -1230.1393980964174,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 238.2758411699356,
			"height": 42.88364785073386,
			"seed": 813417412,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "Co48HahS",
					"type": "text"
				},
				{
					"id": "uS4iWpSacoss4I2Lc2_0l",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 520,
			"versionNonce": 73106884,
			"index": "b2N",
			"isDeleted": false,
			"id": "Co48HahS",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1514.1886393695531,
			"y": -1221.1975741710505,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 212.95982360839844,
			"height": 25,
			"seed": 2141086204,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "BranchEliminationPass",
			"rawText": "BranchEliminationPass",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "avDZFZVekTYd9kbCMaEVq",
			"originalText": "BranchEliminationPass",
			"lineHeight": 1.25
		},
		{
			"type": "rectangle",
			"version": 526,
			"versionNonce": 1841292484,
			"index": "b2NV",
			"isDeleted": false,
			"id": "QVssIbsEPWeKYg-TibryI",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1502.403922273677,
			"y": -1164.0380843499026,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 237.40254900250716,
			"height": 42.88364785073386,
			"seed": 873608956,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "2NQZeWVV",
					"type": "text"
				},
				{
					"id": "o9Rd0qTnRdZlJaSGawG2g",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 524,
			"versionNonce": 1231989828,
			"index": "b2O",
			"isDeleted": false,
			"id": "2NQZeWVV",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1529.9352748999304,
			"y": -1155.0962604245358,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 182.33984375,
			"height": 25,
			"seed": 1943660484,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "FuncDecoratePass",
			"rawText": "FuncDecoratePass",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "QVssIbsEPWeKYg-TibryI",
			"originalText": "FuncDecoratePass",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 1350,
			"versionNonce": 668946812,
			"index": "b2P",
			"isDeleted": false,
			"id": "4Pvgtm_7EgcD_j3fug-ma",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1311.2488953984573,
			"y": -1131.497320103816,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 185.30597877756827,
			"height": 140.13577038020662,
			"seed": 508966268,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "u6Ml52EOVnX9svEig4o1c",
				"focus": 0.39771544746689497,
				"gap": 1
			},
			"endBinding": {
				"elementId": "0sYJP8utj-5zfL-vGfTM7",
				"focus": 0.7898924549236275,
				"gap": 2.355878108187653
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					185.30597877756827,
					-140.13577038020662
				]
			]
		},
		{
			"type": "arrow",
			"version": 1296,
			"versionNonce": 1285431932,
			"index": "b2Q",
			"isDeleted": false,
			"id": "uS4iWpSacoss4I2Lc2_0l",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1311.2488953984575,
			"y": -1133.0234136048766,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 186.75525075265386,
			"height": 71.2355730889783,
			"seed": 1744344260,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "u6Ml52EOVnX9svEig4o1c",
				"focus": 0.1534102388139146,
				"gap": 1.0000000000002274
			},
			"endBinding": {
				"elementId": "avDZFZVekTYd9kbCMaEVq",
				"focus": 0.6331753461085902,
				"gap": 3.5264844376731617
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					186.75525075265386,
					-71.2355730889783
				]
			]
		},
		{
			"type": "arrow",
			"version": 1322,
			"versionNonce": 983348092,
			"index": "b2R",
			"isDeleted": false,
			"id": "o9Rd0qTnRdZlJaSGawG2g",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1311.2488953984573,
			"y": -1138.2945294818312,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 189.6164552323521,
			"height": 10.986773538222906,
			"seed": 1516302460,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177744,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "u6Ml52EOVnX9svEig4o1c",
				"focus": -0.5052419870989591,
				"gap": 1
			},
			"endBinding": {
				"elementId": "QVssIbsEPWeKYg-TibryI",
				"focus": -0.7858668093962453,
				"gap": 1.538571642867396
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					189.6164552323521,
					10.986773538222906
				]
			]
		},
		{
			"type": "rectangle",
			"version": 557,
			"versionNonce": 1944486340,
			"index": "b2S",
			"isDeleted": false,
			"id": "NoGxX9YkAyVvKwvNquOO4",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1503.1012937582732,
			"y": -1092.823715336847,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 236.70517751791098,
			"height": 42.88364785073386,
			"seed": 118932476,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "yZ04PNKT",
					"type": "text"
				},
				{
					"id": "Ecd7Up5awpPZyWz02huaG",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 560,
			"versionNonce": 1790552388,
			"index": "b2T",
			"isDeleted": false,
			"id": "yZ04PNKT",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1586.3539145606858,
			"y": -1083.88189141148,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 70.19993591308594,
			"height": 25,
			"seed": 1410655356,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "....Pass",
			"rawText": "....Pass",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "NoGxX9YkAyVvKwvNquOO4",
			"originalText": "....Pass",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 1377,
			"versionNonce": 1961559164,
			"index": "b2U",
			"isDeleted": false,
			"id": "Ecd7Up5awpPZyWz02huaG",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1311.2488953984573,
			"y": -1132.2003581110155,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 190.85239835981588,
			"height": 73.66166195940048,
			"seed": 264397892,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "u6Ml52EOVnX9svEig4o1c",
				"focus": -0.6101917822068129,
				"gap": 1
			},
			"endBinding": {
				"elementId": "NoGxX9YkAyVvKwvNquOO4",
				"focus": -0.8776444986576708,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					190.85239835981588,
					73.66166195940048
				]
			]
		},
		{
			"type": "rectangle",
			"version": 528,
			"versionNonce": 1728413636,
			"index": "b2UV",
			"isDeleted": false,
			"id": "WpU8OAL8zXGhHpvnHrEIE",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1203.0614879098787,
			"y": -1697.3754105853482,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 298.26434443555394,
			"height": 323.9946533669877,
			"seed": 386154876,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "e1sw1KQE",
					"type": "text"
				},
				{
					"id": "ZXVR4jzNSpsYJXFWkoE5i",
					"type": "arrow"
				},
				{
					"id": "kNi1FOq7kn8tzW481jKdA",
					"type": "arrow"
				},
				{
					"id": "23PYTxor72QX7MctU-QTg",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 636,
			"versionNonce": 1565058884,
			"index": "b2V",
			"isDeleted": false,
			"id": "e1sw1KQE",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1228.3037599201361,
			"y": -1685.3780839018543,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 247.77980041503906,
			"height": 300,
			"seed": 1648877764,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "InstGenBase\n----------------\nCodeGen*\n------------\nGenerateOn(LoadSSA&)\nGenerateOn(StoreSSA&)\nGenerateOn(AccessSSA&)\nGenerateOn(BinarySSA&)\nGenerateOn(UnarySSA&)\nGenerateOn(...)\nDump(ostream&)\nRunPass(PassPtr&)",
			"rawText": "InstGenBase\n----------------\nCodeGen*\n------------\nGenerateOn(LoadSSA&)\nGenerateOn(StoreSSA&)\nGenerateOn(AccessSSA&)\nGenerateOn(BinarySSA&)\nGenerateOn(UnarySSA&)\nGenerateOn(...)\nDump(ostream&)\nRunPass(PassPtr&)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "WpU8OAL8zXGhHpvnHrEIE",
			"originalText": "InstGenBase\n----------------\nCodeGen*\n------------\nGenerateOn(LoadSSA&)\nGenerateOn(StoreSSA&)\nGenerateOn(AccessSSA&)\nGenerateOn(BinarySSA&)\nGenerateOn(UnarySSA&)\nGenerateOn(...)\nDump(ostream&)\nRunPass(PassPtr&)",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 1223,
			"versionNonce": 2056852860,
			"index": "b2X",
			"isDeleted": false,
			"id": "ZXVR4jzNSpsYJXFWkoE5i",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1346.4494814651218,
			"y": -1372.3807572183605,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 25.507024532076684,
			"height": 63.34100161240485,
			"seed": 855187524,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "WpU8OAL8zXGhHpvnHrEIE",
				"focus": -0.2793978985459921,
				"gap": 1
			},
			"endBinding": {
				"elementId": "tWQWrOL3VIGihn9_VvWQy",
				"focus": 0.13127236087129707,
				"gap": 1.953571038382961
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					-25.507024532076684,
					63.34100161240485
				]
			]
		},
		{
			"type": "rectangle",
			"version": 503,
			"versionNonce": 284941508,
			"index": "b2XV",
			"isDeleted": false,
			"id": "6DgxAjWiYNjBf1dbctWzV",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 765.8833829662403,
			"y": -1641.7938884541218,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 327.43600859369644,
			"height": 222.5524674942513,
			"seed": 1211164740,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "e8ULuLsL",
					"type": "text"
				},
				{
					"id": "wCrH5dbjpCcWd6VwZS_UZ",
					"type": "arrow"
				},
				{
					"id": "oLkIzyZ9Re3ev6-fK88CS",
					"type": "arrow"
				},
				{
					"id": "tJj_UJ_XLzJzKTfElSAC2",
					"type": "arrow"
				},
				{
					"id": "23PYTxor72QX7MctU-QTg",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 681,
			"versionNonce": 309044292,
			"index": "b2Y",
			"isDeleted": false,
			"id": "e8ULuLsL",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 780.8014910228542,
			"y": -1630.5176547069962,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 297.59979248046875,
			"height": 200,
			"seed": 1730788604,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "AArch32ArchInfo\n--------------------\n(S) AArch32InstGen\n(S) RegList\n--------------\nGetPtrSize()\nGetInstGen() -> InstGenBase\nGetPassList(optlvl)",
			"rawText": "AArch32ArchInfo\n--------------------\n(S) AArch32InstGen\n(S) RegList\n--------------\nGetPtrSize()\nGetInstGen() -> InstGenBase\nGetPassList(optlvl)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "6DgxAjWiYNjBf1dbctWzV",
			"originalText": "AArch32ArchInfo\n--------------------\n(S) AArch32InstGen\n(S) RegList\n--------------\nGetPtrSize()\nGetInstGen() -> InstGenBase\nGetPassList(optlvl)",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 1254,
			"versionNonce": 1186391676,
			"index": "b2Z",
			"isDeleted": false,
			"id": "wCrH5dbjpCcWd6VwZS_UZ",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 703.1599778667418,
			"y": -1406.9374080783007,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 60.58847664634152,
			"height": 61.86206392185545,
			"seed": 675880388,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "ZvwU6Ai4YxjF-H_NQAVuv",
				"focus": 0.6386006627535453,
				"gap": 1
			},
			"endBinding": {
				"elementId": "6DgxAjWiYNjBf1dbctWzV",
				"focus": 0.3865203012261061,
				"gap": 2.1349284531570447
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					60.58847664634152,
					-61.86206392185545
				]
			]
		},
		{
			"type": "rectangle",
			"version": 611,
			"versionNonce": 667449796,
			"index": "b2a",
			"isDeleted": false,
			"id": "RIrygesdlaebveRT9xDpa",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 616.7671317968766,
			"y": -1283.6296583171973,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 327.43600859369644,
			"height": 222.5524674942513,
			"seed": 1049626492,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [
				{
					"id": "bXj2e6jF",
					"type": "text"
				},
				{
					"id": "oLkIzyZ9Re3ev6-fK88CS",
					"type": "arrow"
				},
				{
					"id": "sqOHX9JIYY2Od7Z1BhcG2",
					"type": "arrow"
				},
				{
					"id": "kNi1FOq7kn8tzW481jKdA",
					"type": "arrow"
				}
			],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"type": "text",
			"version": 792,
			"versionNonce": 1067229508,
			"index": "b2b",
			"isDeleted": false,
			"id": "bXj2e6jF",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 631.6852398534904,
			"y": -1272.3534245700716,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 297.59979248046875,
			"height": 200,
			"seed": 1654241276,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 20,
			"fontFamily": 1,
			"text": "RISCV32ArchInfo\n--------------------\n(S) RISCV32InstGen\n(S) RegList\n--------------\nGetPtrSize()\nGetInstGen() -> InstGenBase\nGetPassList(optlvl)",
			"rawText": "RISCV32ArchInfo\n--------------------\n(S) RISCV32InstGen\n(S) RegList\n--------------\nGetPtrSize()\nGetInstGen() -> InstGenBase\nGetPassList(optlvl)",
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "RIrygesdlaebveRT9xDpa",
			"originalText": "RISCV32ArchInfo\n--------------------\n(S) RISCV32InstGen\n(S) RegList\n--------------\nGetPtrSize()\nGetInstGen() -> InstGenBase\nGetPassList(optlvl)",
			"lineHeight": 1.25
		},
		{
			"type": "arrow",
			"version": 1427,
			"versionNonce": 1347712892,
			"index": "b2d",
			"isDeleted": false,
			"id": "oLkIzyZ9Re3ev6-fK88CS",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 673.1912754396639,
			"y": -1344.7220419842445,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 2.9059527256108595,
			"height": 60.092383667047216,
			"seed": 897840124,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "ZvwU6Ai4YxjF-H_NQAVuv",
				"focus": -0.7468292532874409,
				"gap": 1.000000000000341
			},
			"endBinding": {
				"elementId": "RIrygesdlaebveRT9xDpa",
				"focus": -0.5852097268420186,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "triangle_outline",
			"points": [
				[
					0,
					0
				],
				[
					2.9059527256108595,
					60.092383667047216
				]
			]
		},
		{
			"type": "arrow",
			"version": 2805,
			"versionNonce": 176277628,
			"index": "b2e",
			"isDeleted": false,
			"id": "JttRgOw6rwbvLTKzRGBV_",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 322.6066269243134,
			"y": -1566.391088957533,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 85.39602841688412,
			"height": 54.379820640647495,
			"seed": 1839317500,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "hfAWLcpPg1yCAtuOO5iyu",
				"focus": 0.2976766675267114,
				"gap": 1.000000000000341
			},
			"endBinding": {
				"elementId": "u2z3GOomihJ0RAP9QlSpY",
				"focus": -0.7350307436688952,
				"gap": 3.2457024009700035
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					85.39602841688412,
					54.379820640647495
				]
			]
		},
		{
			"type": "arrow",
			"version": 1486,
			"versionNonce": 1682889084,
			"index": "b2f",
			"isDeleted": false,
			"id": "tJj_UJ_XLzJzKTfElSAC2",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1073.6067229306036,
			"y": -1418.2414209598705,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 52.35976917853782,
			"height": 108.22254998923609,
			"seed": 1997300676,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "6DgxAjWiYNjBf1dbctWzV",
				"focus": -0.41223713914633237,
				"gap": 1
			},
			"endBinding": {
				"elementId": "tWQWrOL3VIGihn9_VvWQy",
				"focus": -0.8038657614351976,
				"gap": 2.93268640306178
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					52.35976917853782,
					108.22254998923609
				]
			]
		},
		{
			"type": "arrow",
			"version": 1685,
			"versionNonce": 1221307004,
			"index": "b2g",
			"isDeleted": false,
			"id": "sqOHX9JIYY2Od7Z1BhcG2",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 945.203140390573,
			"y": -1145.190827435393,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 179.38453367148077,
			"height": 115.00426448916483,
			"seed": 337095236,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "RIrygesdlaebveRT9xDpa",
				"focus": 0.61397595526632,
				"gap": 1
			},
			"endBinding": {
				"elementId": "tWQWrOL3VIGihn9_VvWQy",
				"focus": 0.6578041338976998,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					179.38453367148077,
					-115.00426448916483
				]
			]
		},
		{
			"type": "arrow",
			"version": 509,
			"versionNonce": 520633212,
			"index": "b2h",
			"isDeleted": false,
			"id": "kNi1FOq7kn8tzW481jKdA",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 945.203140390573,
			"y": -1216.7765960919498,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 256.85834751930565,
			"height": 210.48689646529192,
			"seed": 2091800188,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "RIrygesdlaebveRT9xDpa",
				"focus": 0.3689643714738846,
				"gap": 1
			},
			"endBinding": {
				"elementId": "WpU8OAL8zXGhHpvnHrEIE",
				"focus": 0.05247508509296078,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					256.85834751930565,
					-210.48689646529192
				]
			]
		},
		{
			"type": "arrow",
			"version": 309,
			"versionNonce": 1242860668,
			"index": "b2i",
			"isDeleted": false,
			"id": "23PYTxor72QX7MctU-QTg",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1094.3193915599368,
			"y": -1511.4898141993372,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 107.7420963499419,
			"height": 7.066011889790616,
			"seed": 384273476,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 2
			},
			"boundElements": [],
			"updated": 1714993177745,
			"link": null,
			"locked": false,
			"startBinding": {
				"elementId": "6DgxAjWiYNjBf1dbctWzV",
				"focus": 0.24448551729198353,
				"gap": 1
			},
			"endBinding": {
				"elementId": "WpU8OAL8zXGhHpvnHrEIE",
				"focus": -0.04061172139633374,
				"gap": 1
			},
			"lastCommittedPoint": null,
			"startArrowhead": null,
			"endArrowhead": "diamond",
			"points": [
				[
					0,
					0
				],
				[
					107.7420963499419,
					-7.066011889790616
				]
			]
		},
		{
			"id": "TulaqOC8CwWAkvuOHjk8R",
			"type": "rectangle",
			"x": -902.6688907135419,
			"y": -1449.4248566186534,
			"width": 707.8637415948069,
			"height": 972.6669057210288,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "b2j",
			"roundness": {
				"type": 3
			},
			"seed": 906056572,
			"version": 216,
			"versionNonce": 788803836,
			"isDeleted": false,
			"boundElements": null,
			"updated": 1714993192496,
			"link": null,
			"locked": false
		},
		{
			"type": "rectangle",
			"version": 255,
			"versionNonce": 959868156,
			"index": "b2k",
			"isDeleted": false,
			"id": "IcGrMCtM67V_8HafXz5CY",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -908.0023463103779,
			"y": -296.92504735351645,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 970.0001525878906,
			"height": 872.0001983642578,
			"seed": 331854148,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false
		},
		{
			"type": "rectangle",
			"version": 403,
			"versionNonce": 1495847620,
			"index": "b2l",
			"isDeleted": false,
			"id": "DklZlyODaLotQH57kykH1",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 296.6495845275424,
			"y": -316.39976816391595,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 612.101216942373,
			"height": 908.2022117845938,
			"seed": 1255962948,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [],
			"updated": 1714993171929,
			"link": null,
			"locked": false
		},
		{
			"type": "rectangle",
			"version": 724,
			"versionNonce": 1710552260,
			"index": "b2n",
			"isDeleted": false,
			"id": "m-xHd1__JGdORcsUb9J0l",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1064.5918509064543,
			"y": -747.4738367418778,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 733.4344282053935,
			"height": 953.5355654629793,
			"seed": 1753193980,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false
		},
		{
			"type": "rectangle",
			"version": 660,
			"versionNonce": 1182309444,
			"index": "b2o",
			"isDeleted": false,
			"id": "SFpQLad5DLqcB_HVJfNmK",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -21.751201813124908,
			"y": -2041.637723138278,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 1803.9797495832343,
			"height": 1016.080953424627,
			"seed": 246417092,
			"groupIds": [],
			"frameId": null,
			"roundness": {
				"type": 3
			},
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false
		},
		{
			"id": "cqYhg1sl",
			"type": "text",
			"x": -759.103826725581,
			"y": -1495.2068683078865,
			"width": 382.3118591308594,
			"height": 35,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "b2r",
			"roundness": null,
			"seed": 1641235524,
			"version": 213,
			"versionNonce": 1397215684,
			"isDeleted": false,
			"boundElements": null,
			"updated": 1714993146690,
			"link": null,
			"locked": false,
			"text": "Lexical & Grammar Analysis",
			"rawText": "Lexical & Grammar Analysis",
			"fontSize": 28,
			"fontFamily": 1,
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "Lexical & Grammar Analysis",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 233,
			"versionNonce": 1448570236,
			"index": "b2s",
			"isDeleted": false,
			"id": "ErGnCq7Y",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": -511.3317893350744,
			"y": 588.1536492517428,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 238.97988891601562,
			"height": 35,
			"seed": 1023332036,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993140202,
			"link": null,
			"locked": false,
			"fontSize": 28,
			"fontFamily": 1,
			"text": "Semantic Analysis",
			"rawText": "Semantic Analysis",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "Semantic Analysis",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 284,
			"versionNonce": 1971968580,
			"index": "b2w",
			"isDeleted": false,
			"id": "wA7AtETG",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 532.1919787720217,
			"y": 604.4869113773927,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 195.29991149902344,
			"height": 35,
			"seed": 1988317948,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993171929,
			"link": null,
			"locked": false,
			"fontSize": 28,
			"fontFamily": 1,
			"text": "IR Generation",
			"rawText": "IR Generation",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "IR Generation",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 597,
			"versionNonce": 411155524,
			"index": "b30",
			"isDeleted": false,
			"id": "rq4rE7nu",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 1368.4584582642096,
			"y": 214.15345597374778,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 213.41587829589844,
			"height": 35,
			"seed": 1508007108,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993180351,
			"link": null,
			"locked": false,
			"fontSize": 28,
			"fontFamily": 1,
			"text": "IR Optimization",
			"rawText": "IR Optimization",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "IR Optimization",
			"lineHeight": 1.25
		},
		{
			"type": "text",
			"version": 514,
			"versionNonce": 153383876,
			"index": "b34",
			"isDeleted": false,
			"id": "spCKybjN",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"angle": 0,
			"x": 803.3220980957524,
			"y": -2080.846391438361,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"width": 338.2398681640625,
			"height": 35,
			"seed": 1485539652,
			"groupIds": [],
			"frameId": null,
			"roundness": null,
			"boundElements": [],
			"updated": 1714993177423,
			"link": null,
			"locked": false,
			"fontSize": 28,
			"fontFamily": 1,
			"text": "Target Code Generation",
			"rawText": "Target Code Generation",
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "Target Code Generation",
			"lineHeight": 1.25
		},
		{
			"id": "CtbOs93Z",
			"type": "text",
			"x": 587.0332821914374,
			"y": 48.756889893094694,
			"width": 10,
			"height": 25,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "b35",
			"roundness": null,
			"seed": 151612796,
			"version": 7,
			"versionNonce": 2036664388,
			"isDeleted": true,
			"boundElements": null,
			"updated": 1714993075048,
			"link": null,
			"locked": false,
			"text": "",
			"rawText": "",
			"fontSize": 20,
			"fontFamily": 1,
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "DklZlyODaLotQH57kykH1",
			"originalText": "",
			"lineHeight": 1.25
		},
		{
			"id": "q8arrWT4",
			"type": "text",
			"x": 928.5720063118257,
			"y": -1451.5517271462536,
			"width": 10,
			"height": 25,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "b36",
			"roundness": null,
			"seed": 1446480580,
			"version": 7,
			"versionNonce": 25267708,
			"isDeleted": true,
			"boundElements": null,
			"updated": 1714993075048,
			"link": null,
			"locked": false,
			"text": "",
			"rawText": "",
			"fontSize": 20,
			"fontFamily": 1,
			"textAlign": "center",
			"verticalAlign": "middle",
			"containerId": "SFpQLad5DLqcB_HVJfNmK",
			"originalText": "",
			"lineHeight": 1.25
		},
		{
			"id": "tTSXixpT-5u6vN7JqfBJR",
			"type": "diamond",
			"x": -1439.5036222578074,
			"y": -1400.073564983505,
			"width": 287.9999542236328,
			"height": 372.0000457763672,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "b37",
			"roundness": {
				"type": 2
			},
			"seed": 7768572,
			"version": 20,
			"versionNonce": 2074304452,
			"isDeleted": true,
			"boundElements": null,
			"updated": 1714993075048,
			"link": null,
			"locked": false
		}
	],
	"appState": {
		"theme": "light",
		"viewBackgroundColor": "#ffffff",
		"currentItemStrokeColor": "#1e1e1e",
		"currentItemBackgroundColor": "transparent",
		"currentItemFillStyle": "solid",
		"currentItemStrokeWidth": 2,
		"currentItemStrokeStyle": "solid",
		"currentItemRoughness": 1,
		"currentItemOpacity": 100,
		"currentItemFontFamily": 1,
		"currentItemFontSize": 28,
		"currentItemTextAlign": "left",
		"currentItemStartArrowhead": null,
		"currentItemEndArrowhead": "diamond",
		"scrollX": 2557.741876094832,
		"scrollY": 2379.2488137437304,
		"zoom": {
			"value": 0.2999999999999999
		},
		"currentItemRoundness": "round",
		"gridSize": null,
		"gridColor": {
			"Bold": "#C9C9C9FF",
			"Regular": "#EDEDEDFF"
		},
		"currentStrokeOptions": null,
		"previousGridSize": null,
		"frameRendering": {
			"enabled": true,
			"clip": true,
			"name": true,
			"outline": true
		},
		"objectsSnapModeEnabled": false
	},
	"files": {}
}
```
%%
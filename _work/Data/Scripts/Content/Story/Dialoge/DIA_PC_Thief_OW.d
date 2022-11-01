// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_DiegoOw_EXIT(C_INFO)
{
	npc			= PC_ThiefOw;
	nr			= 999;
	condition	= DIA_DiegoOw_EXIT_Condition;
	information	= DIA_DiegoOw_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_DiegoOw_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//******************************************************************
//				Begrüssung
//******************************************************************
INSTANCE DIA_DiegoOw_Hallo(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_DiegoOw_Hallo_Condition;
	information	= DIA_DiegoOw_Hallo_Info;

	Important	= TRUE;
};                       
FUNC INT DIA_DiegoOw_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Hallo_Info()
{	
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_00");//Oye, creía que estabas muerto.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_01");//Sí... lo estaba.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_02");//Pero he vuelto y busco pruebas de la llegada de los dragones.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_03");//¿Para quién trabajas?
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_04");//Para lord Hagen. Con la ayuda de los paladines, podremos parar a los dragones.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_05");//¿Los paladines? Déjame que te diga algo. Después de que arreglármelas para huir de aquí, fui a Khorinis.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_06");//Quería avisar a los paladines de la presencia de los dragones. A saber por qué me molesté en intentarlo.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_07");//Ese creído de Lothar ni siquiera me escuchó y, desde luego, no me dejó hablar con lord Hagen.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_08");//En cambio, me mandó aquí con la expedición. Así que no me hables de los paladines...
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_09");//Lo importante es parar a los dragones mientras estemos a tiempo. Da igual quién nos ayude a conseguirlo.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_10");//¿Pararlos? Lo que deberíamos hacer es sacar el culo de este valle mientras podemos.
	
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_03");//Dime, ¿cómo te las arreglaste para cruzar el paso? Creía que estaba lleno de orcos.
	AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_04");//Hay un camino a través de la mina abandonada que no vigilan los orcos.
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_05");//Es bueno saberlo. Entonces no tardaré en ir a Khorinis. Tengo que ajustar cuentas.
};	

//******************************************************************
//				Beweise
//******************************************************************
INSTANCE DIA_DiegoOw_Beweise(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 2;
	condition	= DIA_DiegoOw_Beweise_Condition;
	information	= DIA_DiegoOw_Beweise_Info;

	description	= "Escucha. Necesito las pruebas.";
};                       
FUNC INT DIA_DiegoOw_Beweise_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Beweise_Info()
{	
		//AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_00");//Was weißt du von Silvestros Erz?
	
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_11"); //Escucha. Necesito las pruebas.
		
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_14");//De acuerdo. Te ayudaré en lo que pueda. Pero no me voy a jugar el cuello por nadie.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_12");//De acuerdo, es tu misión. Habla con el comandante Garond.
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_13");//Si alguien sabe algo de los ataques de los dragones, serán los chicos del castillo.
	};
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_00");//Viajo por encargo de Garond. Necesita saber cuánto mineral se ha extraído hasta ahora.
		AI_Output (self ,other,"DIA_DiegoOw_Garond_11_01");//¿Entonces te dará la prueba que quieres?
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_02");//Correcto. Así que, ¿puedes decirme algo al respecto?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Garond_11_01"); //Y mientras estés en el castillo, puedes contarle a Garond algo que va a interesarle mucho:
	};
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") <= 1000)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_01"); //Hay CUATRO cofres de mineral en la parte trasera de la cueva. La gente de Silvestro ha extraído el mineral.
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_02"); //Garond puede venir cuando quiera a recogerlo, pero para entonces yo no estaré aquí.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_01"); //En la cueva, cerca de donde me escondí, encontrará CUATRO cajas de mineral. Los hombres de Silvestro lo extrajeron.
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_02"); //Garond puede ir a recogerlos - a mí no me sirven para nada...
	};
	
	Silvestro_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Diego ha traído CUATRO cajones del mineral que han extraído los raspadores de Silvestro. Ahora está a salvo.");
};
//******************************************************************
//			Mine
//******************************************************************
INSTANCE DIA_DiegoOw_Mine(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 3;
	condition	= DIA_DiegoOw_Mine_Condition;
	information	= DIA_DiegoOw_Mine_Info;
	permanent	= FALSE;
	description = "¿Cómo es que te hiciste con el mineral?";
};                       

FUNC INT DIA_DiegoOw_Mine_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_DiegoOw_Beweise))
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Mine_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Mine_15_00");//¿Cómo es que te hiciste con el mineral?
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_01");//Estaba con el grupo de Silvestro. Habíamos estado de prospecciones durante varios días y Silvestro se puso nervioso de repente.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_02");//Dijo que deberíamos llevar el mineral a un lugar seguro.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_03");//Como de todas maneras tenía pensado salir pitando, me presenté voluntario para esconder el mineral.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_04");//Y fue toda una suerte, porque los raspadores se encontraron con reptadores de la mina y ninguno sobrevivió.
};
//******************************************************************
//			Ritter
//******************************************************************
INSTANCE DIA_DiegoOw_Ritter(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 4;
	condition	= DIA_DiegoOw_Ritter_Condition;
	information	= DIA_DiegoOw_Ritter_Info;
	permanent	= FALSE;
	description = "¿Y qué hay de los dos caballeros muertos…?";
};                       

FUNC INT DIA_DiegoOw_Ritter_Condition()
{	
	if (Npc_HasItems (PAL_Leiche4,ItMI_OldCoin) == 0)
	|| (Npc_HasItems (PAL_Leiche5,ItMI_OldCoin) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Ritter_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Ritter_15_00");//¿Y qué hay de los dos caballeros que hay muertos delante de tu escondite?
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_01");//Les llegó la hora luchando con un grupo de chasqueadores.
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_02");//Bien, el Valle de las Minas tiene sus propias reglas. Se lo dije, pero no quisieron hacerme caso.
};
//******************************************************************
//			Perm
//******************************************************************
INSTANCE DIA_DiegoOw_Perm(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 5;
	condition	= DIA_DiegoOw_Perm_Condition;
	information	= DIA_DiegoOw_Perm_Info;
	permanent	= FALSE;
	description = "¿Qué necesito saber del valle?";
};                       
FUNC INT DIA_DiegoOw_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Perm_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Perm_15_00");//¿Qué necesito saber del valle?
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_01");//Desde la caída de la barrera, han cambiado un par de cosas. Ahora los orcos son los que mandan.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_02");//Los humanos no somos nada más que pasto para los auténticos señores del valle: los dragones.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_03");//Aléjate de cualquiera que sea más fuerte que tú y evita a todo lo que se parezca a un dragón.
};

//******************************************************************
//			Gorn Freikaufen
//******************************************************************
INSTANCE DIA_DiegoOw_Gorn(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 6;
	condition	= DIA_DiegoOw_Gorn_Condition;
	information	= DIA_DiegoOw_Gorn_Info;
	permanent	= FALSE;
	description = "Quiero comprar la libertad de Gorn...";
};                       

FUNC INT DIA_DiegoOw_Gorn_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoOw_Gorn_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Gorn_15_00");//Quiero comprar la libertad de Gorn, pero Garond me pide 1000 monedas de oro.
	AI_Output (self ,other,"DIA_DiegoOw_Gorn_11_01");//Una bonita suma. Tengo 300 monedas de oro y puedes quedártelas. El resto lo tendrás que poner tú.
	
	B_GiveInvItems (self, other, ItmI_Gold, 300);
	
	B_LogEntry (TOPIC_RescueGorn,"Diego ha pagado 300 piezas de oro para liberar a Gorn.");
};

//******************************************************************
//		Kannst du mir was beibringen?
//******************************************************************
var int Diego_MerkeDEX;
var int Diego_MerkeSTR;
// -----------------------------------------------------------------
instance DIA_DiegoOw_Teach(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 100;
	condition	= DIA_DiegoOw_Teach_Condition;
	information	= DIA_DiegoOw_Teach_Info;
	permanent	= TRUE;
	description = "¿Puedes enseñarme algo?";
};                       
func INT DIA_DiegoOw_Teach_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_DiegoOw_Teach_info ()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Teach_15_00");//¿Puedes enseñarme algo?
	AI_Output (self, other,"DIA_Addon_DiegoOw_Teach_11_01");//Claro, ¿qué quieres saber?
		
	Diego_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Diego_MerkeSTR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_Teach, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //Ya has adquirido cierta destreza.
	};
	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //(pensándoselo) Bien. Te has fortalecido.
	};
	
	Info_ClearChoices (DIA_DiegoOw_TEACH);
};
func void DIA_DiegoOw_TEACHDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};
func void DIA_DiegoOw_TEACHSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices   (DIA_DiegoOw_TEACH);
	Info_AddChoice 		(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice		(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_DiegoOw_TEACHSTR_5);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_ThiefOW_PICKPOCKET (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 900;
	condition	= DIA_ThiefOW_PICKPOCKET_Condition;
	information	= DIA_ThiefOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_ThiefOW_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_ThiefOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice		(DIA_ThiefOW_PICKPOCKET, DIALOG_BACK 		,DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_ThiefOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_ThiefOW_PICKPOCKET);
};
	
func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_ThiefOW_PICKPOCKET);
};

// ************************************************************
// *** 														***
// 					Mit Diego Durch die Gegend
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 					Lass uns zusammen gehen!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Together(C_INFO)
{
	npc			= 	PC_ThiefOW;
	nr		 	= 	11;
	condition	= 	DIA_Addon_ThiefOW_Together_Condition;
	information	= 	DIA_Addon_ThiefOW_Together_Info;

	description	= 	"Vayamos juntos.";
};
func int DIA_Addon_ThiefOW_Together_Condition ()
{
	return TRUE;
};
func void DIA_Addon_ThiefOW_Together_Info ()
{
	AI_Output (other, self,	"DIA_Addon_Diego_Together_15_00"); //Vayamos juntos.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_01"); //¿Al paso? Por qué no
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_02"); //Tú primero. Acabas de venir de allí.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_03"); //Pero ni se te ocurra acercarte demasiado al castillo o a la muralla orca.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_04"); //Además, hay que evitar todos los campamentos fortificados de los paladines.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_05"); //Acabo de escapar de uno y no tengo intención de volver a picar en esas minas.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_06"); //Y ni qué decir tiene que nada de acercarse a ningún dragón.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_07"); //Avísame cuando estés preparado.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_ComeOn(C_INFO)
{
	npc			= 	PC_ThiefOW;
	nr		 	= 	12;
	condition	= 	DIA_Addon_ThiefOW_ComeOn_Condition;
	information	= 	DIA_Addon_ThiefOW_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Ven conmigo.";
};
func int DIA_Addon_ThiefOW_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_ThiefOW_Together))
	&& (Diego_angekommen == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_ThiefOW_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Diego_ComeOn_15_00"); //Ven conmigo.
	
	if (C_DiegoTooFar(0))
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_01"); //¡No es por allí!

		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_02"); //Muy bien.

		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_GoHome(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 13;
	condition	= DIA_Addon_ThiefOW_GoHome_Condition;
	information	= DIA_Addon_ThiefOW_GoHome_Info;
	permanent	= TRUE;
	description = "Espera aquí.";
};                       
FUNC INT DIA_Addon_ThiefOW_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_ThiefOW_GoHome_Info()
{	
	AI_Output (other, self,"DIA_Addon_Diego_WarteHier_15_00"); //¡Espera aquí!
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") < 2000)
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_01"); //Vale. 
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else if (Npc_GetDistToWP (self, "DT_E1_04") < (1500+1000)) //XARDAS
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_02"); //Esperaré fuera, junto a la torre.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"XARDAS");
	}
	else if (Npc_GetDistToWP (self, "OW_NEWMINE_11") < (4000+1000)) //FAJETHMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_03"); //Esperaré cerca de la mina.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"FAJETH");
	}
	else if (Npc_GetDistToWP (self, "OW_MINE3_OUT") < (1200+1000)) //SILVESTROMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_04"); //Esperaré a la entrada de la mina.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"SILVESTRO");
	}
	else if (Npc_GetDistToWP (self, "OW_PATH_266") < (3000+1000)) //GRIMESMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_05"); //Esperaré por aquí cerca.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"GRIMES");
	}
	else if (Npc_GetDistToWP (self, "LOCATION_02_05") < 15000) //Orcbarrier FIRE ANGAR LAKE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_06"); //No. Voy a volver a la cueva.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_07"); //Vuelve a verme cuando hayas terminado.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_08"); //Pero no me hagas esperar mucho o volveré yo también.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else //zu weit weg
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_09"); //Debes de estar de guasa. ¿Quieres que nos separemos? ¿Aquí?
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_10"); //¡Por encima de mi cadáver!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_11"); //Ahora iremos al paso, y juntos.
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_00"); //Ve delante y echa un vistazo. Yo te esperaré fuera.
};
// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_01"); //Para llegar al paso hay que ir en la otra dirección.
};
// ------------------------------------------------------------
var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_TooFar(C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 14;
	condition	= DIA_Addon_ThiefOW_TooFar_Condition;
	information	= DIA_Addon_ThiefOW_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{	
		if (C_DiegoTooFar(0))
		{
			if (Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
};

FUNC VOID DIA_Addon_ThiefOW_TooFar_Info()
{	
	if (C_DiegoTooFar(1000) == LOC_ANGAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_02"); //Hay algo raro en esta antigua tumba.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_03"); //Mejor será rodearla.
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_04"); //Esta es la entrada al antiguo Campamento Nuevo. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_05"); //Seguro que ahora vive algún dragón por aquí.
			B_Addon_Diego_PassOtherDirection();
			Diego_IceVariation = 1;
		}
		else //1 
		{
			B_Addon_Diego_PassOtherDirection();
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SWAMP)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_06"); //Este pantano es un callejón sin salida.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_07"); //No me sorprendería que hubiera un dragón acechándonos dentro.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_08"); //Mejor que no entremos.
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_09"); //Si seguimos subiendo la montaña, seguro que nos encontramos al dragón.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_10"); //Y me gustaría llegar a Khorinis VIVO.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_11"); //Tomemos una ruta alternativa.
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_12"); //Esta lago no lleva a ninguna parte.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_13"); //¡Para llegar al paso tenemos que ir en la otra dirección!
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_14"); //Esta es la vieja torre de Xardas. Él, por supuesto, desapareció hace tiempo.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_15"); //Seguro que dentro nos esperan sorpresas no muy agradables. 
			B_Addon_Diego_WillWaitOutside();
			Diego_XardasVariation = 1;
		}
		else //1
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos (self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine	(self,"XARDAS");
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_FAJETHMINE)
	{
		if (Diego_FajethVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_16"); //Ahí atrás está la mina de Fajeth.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_17"); //¡Si piensas entrar, no cuentes conmigo!
			Diego_FajethVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_18"); //¡No pienso acercarme ni de broma!
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_19"); //Esa es la mina donde me llevaron cuando volví con la colonia penal.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_20"); //Seguro que no queda NADIE vivo dentro.
			B_Addon_Diego_WillWaitOutside();
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //Si tardas mucho, me vuelvo al campamento.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //A menos que quieras que te espere aquí.
			Diego_SilvestroVariation = 1;
		}
		else //1
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos (self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine	(self,"SILVESTRO");
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_GRIMESMINE)
	{
		if (Diego_GrimesVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_21"); //Esta es una de las minas nuevas de los paladines. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_22"); //Nunca he estado dentro y no quiero estrenarme todavía.
			Diego_GrimesVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_23"); //Voto por mantenernos alejados de esa mina.
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_24"); //¿Quieres suicidarte? Mantente bien alejado de ese castillo.
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{	
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_25"); //Eh, ¿me estás prestando atención? ¡No te acerques al castillo!
			Diego_BurgVariation = 2;
		}
		else //2
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_26"); //¿Qué es lo que no entiendes de 'no te acerques al castillo'?
			Diego_BurgVariation = 1;
		};	
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_27"); //No podemos seguir aquí. La barrera orca es demasiado peligrosa.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_28"); //Más valdría que volviéramos a ir hacia el oeste y fuéramos por el otro lado.
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_29"); //Si continuamos en esta dirección, llegaremos de nuevo a la barrera orca.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_30"); //¡Vamos al paso!
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_02"); //Iré solo el resto del camino.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_03"); //Tengo asuntos que solucionar antes de volver a Khorinis.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_04"); //Gracias, amigo mío. Nos vemos en la ciudad.
	
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"PASS");
	
	Diego_angekommen = TRUE;
};
// ------------------------------------------------------------
INSTANCE DIA_Addon_ThiefOW_Angekommen (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_Addon_ThiefOW_Angekommen_Condition;
	information	= DIA_Addon_ThiefOW_Angekommen_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_Angekommen_Condition()
{
	if (Npc_GetDistToWP (self, "OW_VM_ENTRANCE") < 800)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_Angekommen_Info()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_01"); //Bien, aquí estamos.
	B_GivePlayerXP (500);
	B_Diego_WirSindDa();
};

// ------------------------------------------------------------
// 							Nostalgie
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Nostalgie (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 1;
	condition	= DIA_Addon_ThiefOW_Nostalgie_Condition;
	information	= DIA_Addon_ThiefOW_Nostalgie_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if (Npc_GetDistToWP (self, "WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_Nostalgie_Info()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //¿Recuerdas la otra vez?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //¿Cuándo nos conocimos por primera vez?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //Hace siglos
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //Había algo MÁS en este lugar. Hmm, ¡maldición! No me acuerdo.
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_05"); //Da igual
	B_GivePlayerXP (500);
	hero.exp = hero.exp + 500;
	PrintScreen (ConcatStrings(NAME_Addon_NostalgieBonus, IntToString(500)), -1, 60, FONT_Screen, 2);
	
	
	B_Diego_WirSindDa();
};


// ------------------------------------------------------------
// 							PERM
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_PERM (C_INFO)
{
	npc			= PC_ThiefOW;
	nr			= 10;
	condition	= DIA_Addon_ThiefOW_PERM_Condition;
	information	= DIA_Addon_ThiefOW_PERM_Info;
	permanent	= TRUE;
	description = "¿Va todo bien?";
};                       
FUNC INT DIA_Addon_ThiefOW_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_DiegoOw_Perm))
	&& (Npc_KnowsInfo(other, DIA_Addon_ThiefOW_Together))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_ThiefOW_PERM_Info()
{	
	AI_Output (other ,self,"DIA_Addon_Diego_PERM_15_00"); //¿Qué tal?
	if (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_01"); //Me vendría bien una poción curativa. ¿No tendrás una para darme?
	}
	else if (DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& 		(Diego_angekommen == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_02"); //Cuando quieras empezar, infórmame.
	}
	else if (Diego_angekommen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_03"); //Bien. Estoy tomándome un descanso.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_04"); //Vale.
	};
};



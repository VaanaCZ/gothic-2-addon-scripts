var int Edgor_Exiteinmal;

INSTANCE DIA_Addon_Edgor_EXIT   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 999;
	condition   = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //Un placer conocerte
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Edgor_PICKPOCKET (C_INFO)
{
	npc			= BDT_1074_Addon_Edgor;
	nr			= 900;
	condition	= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information	= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen (10, 7);
};
 
FUNC VOID DIA_Addon_Edgor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	B_Say (self, self, "$AWAKE");
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
	
func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Hi   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent   = FALSE;
	description = "�Qu� tal va todo?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //�Qu� tal todo?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //�Quieres saber qu� tal? Pues te dir� qu� tal.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Primero, unos piratas me trajeron aqu� en una noche de tormenta, vomit� por toda la embarcaci�n.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //Luego Raven cerr� la mina porque hay gente imb�cil a las que el oro les ciega de codicia.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //Y luego Franco se hizo l�der de los cazadores para matar a todo el que se le pon�a en contra.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Dir�a que todo va bastante mal.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//---------------------------------------------------------------------
//	Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Franco (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent   = FALSE;
	description = "�C�mo consigui� Franco llegar a ser l�der?";
};
FUNC INT DIA_Addon_Edgor_Franco_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Franco_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //�C�mo consigui� Franco llegar a ser l�der?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Muy f�cil. Mat� a Fletcher, el anterior l�der de los cazadores.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher estaba bien. Franco nos toma el pelo a todos.
};	

//---------------------------------------------------------------------
//	Info MIS2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_MIS2   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent   = FALSE;
	description = "Franco me env�o por esta tablilla de piedra�";
};
FUNC INT DIA_Addon_Edgor_MIS2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franco me env�a por el asunto de la tablilla de piedra. �La has encontrado?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //T�o, ni siquiera la he buscado. S�lo s� que se supone que est� en esta vieja casa, en las profundidades del pantano.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //Y algo en mi interior me dice: 'Edgor, no te acerques a casas viejas en la profundidades del pantano'.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //�No pienso arriesgar mi vida por ese memo de Franco!
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor nunca se pondr� a buscar la tablilla de piedra. Dice que est� en alg�n lugar de una vieja casa de la ci�naga.");
};
//---------------------------------------------------------------------
//	Info Wegbeschreibung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Weg   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent   = FALSE;
	description = "�D�nde est� exactamente esa vieja casa?";
};
FUNC INT DIA_Addon_Edgor_Weg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Edgor_MIS2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Weg_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //�D�nde est� exactamente esa vieja casa?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Ve a la izquierda hasta pasar la gran roca que hay. Al cabo de un rato, llegar�s a otra enorme roca.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Cuando la pases, tienes que ir a la derecha o a la izquierda, pero no s� m�s, fue hace mucho tiempo.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Pero se supone que las ruinas est�n en una especie de meseta, aunque ocultas por la vegetaci�n.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Quiz� tengas suerte y no lo encuentres
};
//---------------------------------------------------------------------
//	Info Found
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Found   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent   = FALSE;
	description = "�He encontrado la tablilla!";
};
FUNC INT DIA_Addon_Edgor_Found_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead (Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Found_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//(satisfecho) �He encontrado la tablilla de piedra!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(aburrido) �En serio? Eres un tipo valiente.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(aburrido) Entonces te has ganado entrar al campamento. (bosteza)
};
//---------------------------------------------------------------------
//	Info Teach
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Teach   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent   = FALSE;
	description = "�Puedes ense�arme algo?";
};
FUNC INT DIA_Addon_Edgor_Teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//�Puedes ense�arme algo?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//Mucho sobre moscas de sangre. �Odio a esas miserables criaturas m�s que a Franco!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Pero s� como arrancar los aguijones y las alas de sus cad�veres. (lun�tico) S�, s� descuartizarlas
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Adem�s, puedo extraer la secreci�n del aguij�n.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Si quieres, puedo ense�arte toda esa morralla.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Por supuesto, aqu� nada es gratuito
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor sabe mucho sobre moscas de sangre y sus trofeos.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Cons�gueme oro. S�lo quiero monedas, no pepitas.
};
//---------------------------------------------------------------------
//	Info Train (Bloodflys)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_TrainStart   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent   = TRUE;
	description = "Sobre las moscas de sangre�";
};
FUNC INT DIA_Addon_Edgor_Start_Condition()
{	
	if (Edgor_Teach == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Start_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//Sobre las moscas de sangre
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//�Qu� quieres saber?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Extraer aguijones de m. sangre (Coste: 5 PA, 100 oro)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Arrancar alas m. sangre (Coste: 5 PA, 100 oro)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Eliminar secreci�n del aguij�n (Coste: 1 PA, 100 oro)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Sting()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//�C�mo arranco los aguijones a las moscas de sangre?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Pon la criatura muerta aboca abajo y �brela en cruz. Saca las entra�as y corta todo el tejido de la espalda.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Retira entonces el aguij�n de un tir�n.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Wing()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//�C�mo le arranco las alas?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//Agarra las alas con una mano. Con la otra, c�rtalas junto a la capa superior de la piel.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_GIFT()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if (other.lp >= 1)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//�C�mo extraigo la secreci�n de las moscas de sangre?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Abre de un corte la capa superior del aguij�n a lo largo y la secreci�n curativa emanar� hacia fuera.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//De este modo, succionar el contenido de un aguij�n es completamente seguro, o usarlo para pociones.
			
			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE; 
			PrintScreen (PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};		



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
//				Begr�ssung
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
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_00");//Hey, ich dachte, du w�rst tot.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_01");//Ja ... war ich auch.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_02");//Jetzt bin ich wieder hier und suche nach Beweisen f�r die Ankunft der Drachen.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_03");//F�r wen machst du das?
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_04");//Ich arbeite f�r Lord Hagen. Mit Hilfe der Paladine k�nnen die Drachen aufgehalten werden.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_05");//Die Paladine? Jetzt sage ich dir mal was. Nachdem ich von hier fliehen konnte, war ich in Khorinis.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_06");//Ich wollte die Paladine vor den Drachen warnen. Wei� der Henker, warum ich das �berhaupt versucht habe.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_07");//Denn dieser aufgeblasene Lothar hat mir nicht mal zugeh�rt - geschweige denn, mich zu Lord Hagen vorgelassen.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_08");//Stattdessen haben sie mich mit der Expedition wieder her geschickt. Also erz�hle mir nichts von den Paladinen ...
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_09");//Mit wessen Hilfe auch immer, wichtig ist nur, dass wir die Drachen aufhalten - solange wir noch Zeit daf�r haben.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_10");//Aufhalten? Wir sollten unsere �rsche aus dem Tal schaffen, solange wir noch Zeit DAF�R haben.
	
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_03");//Sag mal - wie bist du eigentlich �ber den Pass gekommen? Ich denke, da sitzen die Orks rum.
	AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_04");//Es gibt einen Weg durch die verlassene Mine, der nicht von Orks besetzt ist.
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_05");//Gut zu wissen. Dann werde ich mich wohl bald nach Khorinis aufmachen - hab da noch ein paar alte Rechnungen zu begleichen.
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

	description	= "H�r zu, ich brauche diese Beweise.";
};                       
FUNC INT DIA_DiegoOw_Beweise_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Beweise_Info()
{	
		//AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_00");//Was wei�t du von Silvestros Erz?
	
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_11"); //H�r zu, ich brauche diese Beweise.
		
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_14");//Okay, wenn ich dir helfen kann, werde ich das tun. Aber ich werde meinen Kopf f�r niemanden in die Schlinge legen.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_12");//Na sch�n, wenn das deine Mission ist - sprich mal mit Kommandant Garond.
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_13");//Wenn jemand was �ber die Drachenangriffe wei�, dann sind es die Jungs in der Burg.
	};
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_00");//Ich bin im Auftrag von Garond unterwegs. Er muss wissen, wie viel Erz bisher gesch�rft wurde.
		AI_Output (self ,other,"DIA_DiegoOw_Garond_11_01");//Und dann gibt er dir die Beweise, die du haben willst?
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_02");//So sieht's aus. Also - kannst du mir was dar�ber erz�hlen?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Garond_11_01"); //Und wenn du schonmal in der Burg bist, kannst du Garond direkt etwas erz�hlen, was ihn sehr interessieren d�rfte:
	};
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") <= 1000)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_01"); //Hier hinten in der H�hle sind die VIER Kisten Erz, die Silvestros M�nner gesch�rft haben.
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_02"); //Die kann sich Garond gerne abholen - aber dann werde ich nicht mehr da sein.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_01"); //In der H�hle, bei der ich mich versteckt hatte, sind die VIER Kisten Erz. Die hatten Silvestros M�nner gesch�rft.
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_02"); //Die kann sich Garond gerne abholen - ich habe sowieso keine Verwendung daf�r...
	};
	
	Silvestro_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Diego hat VIER Kisten Erz von Silvestro's Sch�rfern in Sicherheit gebracht.");
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
	description = "Wie bist du an das Erz gekommen?";
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
	AI_Output (other ,self,"DIA_DiegoOw_Mine_15_00");//Wie bist du an das Erz gekommen?
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_01");//Ich war bei Silvestros Truppe. Wir sch�rfen da also schon ein paar Tage, da wird Silvestro auf einmal unruhig.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_02");//Er meinte, wir m�ssen das Erz unbedingt an einen sicheren Ort bringen.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_03");//Na ja, da ich eh vor hatte, mich abzusetzen, habe ich dann die Sicherstellung des Erzes �bernommen.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_04");//Und das war mein Gl�ck. Denn die Sch�rfer sind auf einige Minecrawler gesto�en. Und das hat keiner �berlebt.
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
	description = "Was ist mit den beiden toten Rittern...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Ritter_15_00");//Was ist mit den beiden toten Rittern vor deinem Versteck?
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_01");//Der Kampf gegen eine Gruppe von Snappern wurde ihnen zum Verh�ngnis.
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_02");//Das Minental hat halt seine eigenen Regeln. Ich hab's ihnen gesagt. Aber sie wollten nicht auf mich h�ren.
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
	description = "Was muss ich �ber das Tal wissen?";
};                       
FUNC INT DIA_DiegoOw_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Perm_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Perm_15_00");//Was muss ich �ber das Tal wissen?
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_01");//Mit dem Fall der Barriere hat sich hier einiges ver�ndert. Die Orks haben hier das Sagen.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_02");//Wir Menschen sind nur noch Futter f�r die wahren Herrscher des Tals: die Drachen.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_03");//Weiche allem aus, was st�rker ist als du - und halte dich von allem fern, was nach Drache aussieht.
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
	description = "Ich will Gorn freikaufen...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Gorn_15_00");//Ich will Gorn freikaufen, aber Garond verlangt 1000 Goldst�cke.
	AI_Output (self ,other,"DIA_DiegoOw_Gorn_11_01");//Ein sch�ner Batzen Gold. Ich habe 300 Goldst�cke dabei, die kannst du mitnehmen. Der Rest liegt an dir.
	
	B_GiveInvItems (self, other, ItmI_Gold, 300);
	
	B_LogEntry (TOPIC_RescueGorn,"Diego hat 300 Goldst�cke zur Befreiung von Gorn beigetragen.");
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
	description = "Kannst du mir was beibringen?";
};                       
func INT DIA_DiegoOw_Teach_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_DiegoOw_Teach_info ()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Teach_15_00");//Kannst du mir was beibringen?
	AI_Output (self, other,"DIA_Addon_DiegoOw_Teach_11_01");//Klar, was willst du wissen?
		
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
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //Du hast schon etwas an Geschicklichkeit gewonnen.
	};
	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //(absch�tzend) Gut. Deine St�rke hat zugenommen.
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

	description	= 	"Lass uns zusammen gehen.";
};
func int DIA_Addon_ThiefOW_Together_Condition ()
{
	return TRUE;
};
func void DIA_Addon_ThiefOW_Together_Info ()
{
	AI_Output (other, self,	"DIA_Addon_Diego_Together_15_00"); //Lass uns zusammen gehen.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_01"); //Zum Pass? Warum nicht...
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_02"); //Geh du voran. Du kommst ja gerade von dort.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_03"); //Aber lass dir nicht einfallen, zu nahe an die Burg oder den Orkwall zu gehen.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_04"); //Au�erdem sollen wir alle befestigten Lager der Paladine meiden.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_05"); //Ich bin gerade aus einem entkommen und habe keine Lust, wieder in einer der Minen schuften zu m�ssen.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_06"); //Und da� wir nicht in die N�he eines Drachen gehen, versteht sich wohl von selbst.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_07"); //Wenn du bereit bist, sag es mir.
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
	description	= 	"Komm mit.";
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
	AI_Output (other, self, "DIA_Addon_Diego_ComeOn_15_00"); //Komm mit.
	
	if (C_DiegoTooFar(0))
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_01"); //Das ist die falsche Richtung!

		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_02"); //Alles klar.

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
	description = "Warte hier.";
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
	AI_Output (other, self,"DIA_Addon_Diego_WarteHier_15_00"); //Warte hier!
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") < 2000)
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_01"); //Okay. 
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else if (Npc_GetDistToWP (self, "DT_E1_04") < (1500+1000)) //XARDAS
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_02"); //Ich warte draussen am Turm.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"XARDAS");
	}
	else if (Npc_GetDistToWP (self, "OW_NEWMINE_11") < (4000+1000)) //FAJETHMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_03"); //Ich warte in der N�he der Mine.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"FAJETH");
	}
	else if (Npc_GetDistToWP (self, "OW_MINE3_OUT") < (1200+1000)) //SILVESTROMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_04"); //Ich warte vor der Mine.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"SILVESTRO");
	}
	else if (Npc_GetDistToWP (self, "OW_PATH_266") < (3000+1000)) //GRIMESMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_05"); //Ich warte hier in der N�he.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"GRIMES");
	}
	else if (Npc_GetDistToWP (self, "LOCATION_02_05") < 15000) //Orcbarrier FIRE ANGAR LAKE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_06"); //Nein. Ich geh wieder zur�ck zur H�hle.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_07"); //Wenn du mit deinem Kram fertig bist, kannst du ja wieder vorbeischauen.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_08"); //Aber warte nicht zu lange. Sonst mache ich mich alleine auf den Weg.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else //zu weit weg
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_09"); //Das ist doch nicht dein Ernst? Wir sollen uns trennen? Hier?
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_10"); //Das kommt nicht in Frage!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_11"); //Wir gehen jetzt sch�n zusammen zum Pass.
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_00"); //Wenn du dich umsehen willst - ich warte draussen.
};
// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_01"); //Wenn wir zum Pass wollen, m�ssen wir in die andere Richtung.
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_02"); //Diese alte Grabst�tte ist mir nicht geheuer.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_03"); //Lass uns lieber drum herum gehen.
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_04"); //Das ist der Eingang zum ehemaligen Neue Lager. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_05"); //Ich bin mir sicher, da drinnen hat sich ein Drache breitgemacht.
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_06"); //Dieser Sumpf ist eine Sackgasse.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_07"); //W�rde ich nicht wundern, wenn da drinnen sogar ein Drache auf uns lauert.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_08"); //Lass uns nicht da reingehen.
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_09"); //Wenn wir den Berg weiter hochgehen, kommen wir garantiert zu einem Drachen.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_10"); //Und ich w�rde gerne LEBEND in Khorinis ankommen.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_11"); //Lass uns einen anderen Weg nehmen.
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_12"); //Dieser See f�hrt uns nirgendwohin.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_13"); //Wenn wir zum Pass wollen, m�ssen wir in die andere Richtung!
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_14"); //Das ist der alte Turm von Xardas. Er hat sich nat�rlich l�ngst aus dem Staub gemacht.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_15"); //Bin mir sicher, da drinnen warten einige unangenehme �berraschungen. 
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_16"); //Das da hinten ist Fajeths Mine.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_17"); //Wenn du da hin willst, dann ohne mich!
			Diego_FajethVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_18"); //Ich werde einen gro�en Bogen um diese Mine machen!
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_19"); //Das ist die Mine, in die sie mich gebracht haben, als ich mit dem Strafkonvoi zur�ckgekommen bin.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_20"); //Ich bin mir sicher, da drinnen lebt KEINER mehr.
			B_Addon_Diego_WillWaitOutside();
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //Aber wenn du zu lange brauchst, geh ich wieder zur�ck zu meinem Lager.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //Es sei denn, du willst, da� ich hier solange warte.
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_21"); //Das ist eine der neuen Minen der Paladine. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_22"); //Ich war noch nie dort - und werde auch nicht hingehen.
			Diego_GrimesVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_23"); //Machen wir einen Bogen um die Mine.
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_24"); //Bist du lebensm�de? Geh blo� nicht zu nahe an die Burg!
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{	
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_25"); //Sag mal, h�rst du mir nicht zu?! Nicht zu nahe an die Burg!
			Diego_BurgVariation = 2;
		}
		else //2
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_26"); //Was ist an 'Nicht zu nahe an die Burg' nicht zu verstehen?
			Diego_BurgVariation = 1;
		};	
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_27"); //Hier k�nnen wir nicht weitergehen. Die Orkbarriere ist zu gef�hrlich.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_28"); //Ich denke, es w�re besser, wenn wir wieder Richtung Westen gehen und einen Bogen zur anderen Seite machen.
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_29"); //Wenn wir hier weitergehen, kommen wir nur wieder zur Orkbarriere.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_30"); //Lass uns zum Pass gehen!
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_02"); //Den Rest des Weges werde ich alleine zur�cklegen.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_03"); //Ich habe da noch einige Dinge zu erledigen, bevor ich nach Khorinis zur�ckgehen kann.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_04"); //Ich danke dir, mein Freund. Wir sehen uns in der Stadt.
	
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
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_01"); //So, wir sind da.
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
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //Wei�t du noch, damals?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //Als wir uns hier das erste Mal trafen?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //Ist ne lange Zeit her...
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //Irgendendwas war NOCH an diesem Ort - hmm - verdammt! Ich kann mich nicht mehr erinnern.
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_05"); //Wie auch immer...
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
	description = "Alles klar?";
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
	AI_Output (other ,self,"DIA_Addon_Diego_PERM_15_00"); //Alles klar?
	if (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_01"); //Ich k�nnte einen Heiltrank gebrauchen. Du hast nicht zuf�llig einen dabei?
	}
	else if (DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& 		(Diego_angekommen == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_02"); //Wenn du losgehen willst, sag Bescheid.
	}
	else if (Diego_angekommen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_03"); //Alles bestens. Ich ruhe mich nur kurz aus.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_04"); //Alles bestens.
	};
};



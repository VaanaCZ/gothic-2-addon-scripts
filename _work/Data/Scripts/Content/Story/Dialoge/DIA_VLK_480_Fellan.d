///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fellan_EXIT   (C_INFO)
{
	npc         = VLK_480_Fellan;
	nr          = 999;
	condition   = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fellan_PICKPOCKET (C_INFO)
{
	npc			= VLK_480_Fellan;
	nr			= 900;
	condition	= DIA_Fellan_PICKPOCKET_Condition;
	information	= DIA_Fellan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fellan_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Fellan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fellan_PICKPOCKET);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_BACK 		,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
	
func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Tough Guy News 
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_News		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  1;
	condition	 = 	DIA_Fellan_News_Condition;
	information	 = 	DIA_Fellan_News_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Fellan_News_Condition ()
{	
	if  Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_News_Info ()
{
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_00"); //Vous m'avez battu, je le reconnais. Quel exploit ! Vous êtes un vrai héros !
	
		 if (MIS_AttackFellan == LOG_RUNNING)
		 && (FellanGeschlagen == FALSE)
		 {
		 	AI_Output (other, self, "DIA_Fellan_News_15_01"); //Vous voulez bien arrêter de vous servir de votre marteau maintenant, ou bien faut-il que je vous donne une autre leçon ?
		 	AI_Output (self, other, "DIA_Fellan_News_06_02"); //Non, ne me frappez plus ! J'arrête ! Mais si tout ça s'effondre, ce sera votre faute !
		 	
		 	FellanGeschlagen = TRUE;
		 	Npc_ExchangeRoutine (self,"OHNEHAMMER");
		 	AI_StopProcessInfos (self);
		 	
		 };
	}; 
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output (self, other, "DIA_Fellan_News_06_03");  //Quel est le problème ? Vous voulez un autre coup de poing dans le nez ?
	};
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_04"); //Vous êtes dingue ou quoi ? Vous commencez par vouloir vous battre, puis par discuter... mais qu'est-ce que vous voulez au juste ?
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_HALLO		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  2;
	condition	 = 	DIA_Fellan_HALLO_Condition;
	information	 = 	DIA_Fellan_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Pourquoi donnez-vous des coups de marteau ?";
};
func int DIA_Fellan_HALLO_Condition ()
{	
	if (FellanGeschlagen == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Fellan_HALLO_15_00"); //Pourquoi donnez-vous tous ces coups de marteau ?
	AI_Output (self, other, "DIA_Fellan_HALLO_06_01"); //Cela fait plusieurs jours que j'essaye de colmater les fuites de ma maison.
	AI_Output (self, other, "DIA_Fellan_HALLO_06_02"); //La charpente s'est affaissée depuis les fortes pluies que nous avons eues récemment. Si ça continue, ma maison va s'écrouler comme un château de cartes !
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_Stop		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr 			 =  3;
	condition	 = 	DIA_Fellan_Stop_Condition;
	information	 = 	DIA_Fellan_Stop_Info;
	permanent	 =  FALSE;
	description	 = 	"Pourriez-vous arrêter de taper ?";
};

func int DIA_Fellan_Stop_Condition ()
{
	if (MIS_AttackFellan == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fellan_Stop_Info ()
{
	AI_Output (other, self, "DIA_Fellan_Stop_15_00"); //Est-ce que vous pourriez arrêter de faire tout ce bruit ?
	AI_Output (self, other, "DIA_Fellan_Stop_06_01"); //Non, il faut que je finisse ça.
	
	Info_ClearChoices (DIA_Fellan_Stop);
	Info_AddChoice (DIA_Fellan_Stop,"Arrêtez de taper ou je vous brise les os.",DIA_Fellan_Stop_Bones);
	Info_AddChoice (DIA_Fellan_Stop,"Je vous donne 10 pièces d'or si vous arrêtez de taper.",DIA_Fellan_Stop_Gold);
	Info_AddChoice (DIA_Fellan_Stop,"Arrêtez de taper, d'accord ?",DIA_Fellan_Stop_Just);
};
FUNC VOID DIA_Fellan_Stop_Bones()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Bones_15_00"); //Cessez ce vacarme ou je vous réduis en miettes !
	AI_Output (self, other, "DIA_Fellan_Stop_Bones_06_01"); //Et vous, arrêtez de me menacer, ou je vous remets les idées en place à coups de marteau !
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Fellan_Stop_Gold()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Gold_15_00"); //Je vous donne 10 pièces d'or si vous cessez ce vacarme.
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_01"); //Hé ! C'est très généreux à vous, mais pour ce qui est de votre or, vous pouvez...
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_02"); //... enfin, j'imagine que vous savez ce que vous pouvez en faire.
};
FUNC VOID DIA_Fellan_Stop_Just()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Just_15_00"); //Arrêtez de faire du bruit, d'accord ?
	AI_Output (self, other, "DIA_Fellan_Stop_Just_06_01"); //Et vous, arrêtez de me chercher, d'accord ?
};
///////////////////////////////////////////////////////////////////////
//	Info Alles klar?
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_klar		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  5;
	condition	 = 	DIA_Fellan_klar_Condition;
	information	 = 	DIA_Fellan_klar_Info;
	permanent	 =  TRUE;
	description	 = 	"Bonjour, vous vous sentez bien ?";
};
func int DIA_Fellan_klar_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Fellan_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fellan_klar_Info ()
{
	AI_Output (other, self, "DIA_Fellan_klar_15_00"); //Hé ! Bonjour ! Comment ça va ?
	
	if (FellanGeschlagen == FALSE) 
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_01"); //Bien. Il faut juste que j'arrive à réparer ma maison à temps.
	}
	else
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_02"); //Le toit ne cesse de s'affaisser. Au prochain orage, je vais me retrouver avec de l'eau jusqu'aux chevilles... et ce sera votre faute !
	};
	AI_StopProcessInfos (self);
};
//Kapitel 2 Miliz Kandidat 






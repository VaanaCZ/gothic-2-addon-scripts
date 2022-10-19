
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kurgan_EXIT   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 999;
	condition   = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (Biff,400);	//Joly: Damit Biff nicht sofort am Anfang Kohle einfordert.
};

//************************************************************************
//	Hello
//************************************************************************
instance DIA_Kurgan_HELLO		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_HELLO_Condition;
	information	= 	DIA_Kurgan_HELLO_Info;

	important	= 	TRUE;
};

func int DIA_Kurgan_HELLO_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info ()
{
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Eh ! Vous ! Des types comme vous devraient faire attention o� ils vont.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //Qu'essayez-vous de me dire ?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //Je dis que l'atmosph�re ici n'est pas bonne pour la sant�. L'endroit regorge d'orques et de monstres.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //Sans parler des dragons. C'est juste un avertissement.
	B_LogEntry (TOPIC_Dragonhunter,"J'ai �t� re�u par un groupe de chasseurs de dragon � l'entr�e de la Vall�e des mines. Ils sont lourdement arm�s mais je crains qu'ils n'impressionnent gu�re les dragons.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"Pouvez-vous me dire quelque chose que je ne sais pas ?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //Pouvez-vous me dire quelque chose que je ne sache d�j� ?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //Je peux vous donner un bon conseil et c'est gratuit.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //On n'a pas besoin ici de types qui fassent semblant d'�tre morts au moindre pet de dragon.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Rentrez chez vous, c'est un travail d'homme.
	
};

//**************************************************************************
//	Bist du hier der Anf�hrer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Etes-vous le patron ici ?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //C'est vous le patron ici ?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //Est-ce que j'en ai l'air ? Certainement pas. On n'a pas besoin d'un type pr�tentieux pour nous donner des ordres.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Quand Sylvio a essay� de jouer au boss, on leur a montr�, � son pote et � lui, ce qu'on en pensait.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //Il y a eu une bagarre. En fin de compte, ils ont d�cid� de partir.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //J'esp�re que Sylvio a fini dans la marmite d'un orque.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen t�ten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"Alors vous voulez tuer des dragons ?";

};

func int DIA_Kurgan_KillDragon_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kurgan_Leader))
		{
				return TRUE;
		};
};
var int Kurgan_KillDragon_Day;
func void DIA_Kurgan_KillDragon_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //(moqueur) Alors vous voulez tuer des dragons ?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //Petit malin. Vous croyez savoir comment abattre un dragon ?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //Vous croyez que la b�te va rester tranquillement assise pendant que vous lui tranchez la t�te ?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //Une telle entreprise demande une bonne organisation et une action d�termin�e.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //Je vois. Et comment allez-vous vous y prendre ?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //D'abord nous allons rep�rer l'endroit o� nous pourrons trouver les b�tes.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Alors nous r�fl�chirons au meilleur moyen d'action.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "J'aimerais bien voir �a mais je dois poursuivre mon chemin.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Comment allez-vous passer les orques ?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Je crois que vous seriez incapable de trouver un mouton aveugle.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //Je crois que vous ne r�ussiriez m�me pas � trouver un mouton aveugle.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //Quoi ? Vous voulez que je vous cogne ?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //Comment allez-vous franchir les orques ?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //On verra ces d�tails plus tard.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //J'aimerais bien assister � �a mais je dois y aller.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Retournez au col sinon vous pourriez perdre un ou deux membres.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info SEENDRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Kurgan_SEENDRAGON		(C_INFO)
{
	npc		 = 	DJG_708_Kurgan;
	condition	 = 	DIA_Kurgan_SEENDRAGON_Condition;
	information	 = 	DIA_Kurgan_SEENDRAGON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Avez-vous d�j� vu un dragon ?";
};

func int DIA_Kurgan_SEENDRAGON_Condition ()
{
	if (Kurgan_KillDragon_Day<=(Wld_GetDay()-2))
		{
				return TRUE;
		};
};

func void DIA_Kurgan_SEENDRAGON_Info ()
{
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //Avez-vous d�j� vu un dragon ?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Non, pas pour l'instant. Mais ces bestiaux ne peuvent pas se cacher �ternellement.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kurgan_AllDragonsDead   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 5;
	condition   = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Les dragons sont morts.";
				
};

FUNC INT DIA_Kurgan_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //Les dragons sont morts.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ah ! Et qui est cens� les avoir tu�s ? Les paladins ?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //Moi.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //(rire) Ah ! Vous n'y croyez pas vous-m�me. Arr�tez de me faire rire.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kurgan_PICKPOCKET (C_INFO)
{
	npc			= DJG_708_Kurgan;
	nr			= 900;
	condition	= DIA_Kurgan_PICKPOCKET_Condition;
	information	= DIA_Kurgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen (34, 120);
};
 
FUNC VOID DIA_Kurgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_BACK 		,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};
	
func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};





///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Grimbald_EXIT   (C_INFO)
{
	npc         = BAU_982_Grimbald;
	nr          = 999;
	condition   = DIA_Grimbald_EXIT_Condition;
	information = DIA_Grimbald_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_HALLO		(C_INFO)
{
	npc		 = 	BAU_982_Grimbald;
	nr		 = 	3;
	condition	 = 	DIA_Grimbald_HALLO_Condition;
	information	 = 	DIA_Grimbald_HALLO_Info;

	description	 = 	"Czekasz tu na kogo�?";
};

func int DIA_Grimbald_HALLO_Condition ()
{
	return TRUE;
};
var int Grimbald_PissOff;

func void DIA_Grimbald_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_15_00"); //Czekasz tu na kogo�?
	
	if 	(
		(Npc_IsDead(Grimbald_Snapper1))
		&& (Npc_IsDead(Grimbald_Snapper2))
		&& (Npc_IsDead(Grimbald_Snapper3)))
			{
				AI_Output			(self, other, "DIA_Grimbald_HALLO_07_01"); //Poluj�. To chyba oczywiste.
				Grimbald_PissOff = TRUE;
			}
			else
			{
				AI_Output			(self, other, "DIA_Grimbald_HALLO_07_02"); //Ju� nie. Przecie� przyszed�e�, prawda?
				
				Info_ClearChoices	(DIA_Grimbald_HALLO);
				Info_AddChoice	(DIA_Grimbald_HALLO, "Musz� si� zaj�� kilkoma sprawami.", DIA_Grimbald_HALLO_nein );
				Info_AddChoice	(DIA_Grimbald_HALLO, "Czym si� zajmujesz?", DIA_Grimbald_HALLO_Was );
				Info_AddChoice	(DIA_Grimbald_HALLO, "Dlaczego czeka�e� na mnie?", DIA_Grimbald_HALLO_ich );
			};
};

func void DIA_Grimbald_HALLO_ich ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_ich_15_00"); //Dlaczego czeka�e� na mnie?
	AI_Output			(self, other, "DIA_Grimbald_HALLO_ich_07_01"); //Wygl�dasz na silnego. Przyda mi si� pomoc kogo� takiego jak ty.
};

func void DIA_Grimbald_HALLO_Was ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_15_00"); //Co chcesz zrobi�?
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_07_01"); //Chc� zapolowa� na z�bacze, ale obawiam si�, �e mo�e ich by� zbyt du�o jak na si�y jednego my�liwego.

	Info_AddChoice	(DIA_Grimbald_HALLO, "Na mnie nie licz.", DIA_Grimbald_HALLO_Was_neinnein );
	Info_AddChoice	(DIA_Grimbald_HALLO, "Dobrze, pomog� ci. Id� przodem.", DIA_Grimbald_HALLO_Was_ja );
};
func void DIA_Grimbald_HALLO_Was_neinnein ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_neinnein_15_00"); //Na mnie nie licz.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_neinnein_07_01"); //Tch�rz!
	Grimbald_PissOff = TRUE;
	Info_ClearChoices	(DIA_Grimbald_HALLO);
};

func void DIA_Grimbald_HALLO_Was_ja ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_Was_ja_15_00"); //Dobrze, pomog� ci. Id� przodem.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_ja_07_01"); //Tylko nie zbli�aj si� za bardzo do czarnego trolla. Rozerwa�by ci� na strz�py, jasne?
	AI_Output			(self, other, "DIA_Grimbald_HALLO_Was_ja_07_02"); //Biada ci, je�li stch�rzysz.
	B_StartOtherRoutine	(self,"Jagd");
	AI_StopProcessInfos (self);
};

func void DIA_Grimbald_HALLO_nein ()
{
	AI_Output			(other, self, "DIA_Grimbald_HALLO_nein_15_00"); //Musz� si� zaj�� kilkoma sprawami.
	AI_Output			(self, other, "DIA_Grimbald_HALLO_nein_07_01"); //Nie ple� bzdur. Co to za wa�ne sprawy, kt�re masz niby za�atwi� w tej g�uszy?
};

///////////////////////////////////////////////////////////////////////
//	Info Jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_Jagd		(C_INFO)
{
	npc		 = 	BAU_982_Grimbald;
	nr		 = 	3;
	condition	 = 	DIA_Grimbald_Jagd_Condition;
	information	 = 	DIA_Grimbald_Jagd_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mo�esz mnie nauczy� polowa�?";
};

func int DIA_Grimbald_Jagd_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Grimbald_HALLO))
	&& (Grimbald_TeachAnimalTrophy == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Grimbald_Jagd_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_Jagd_15_00"); //Mo�esz mnie nauczy� czego� o polowaniu?
	if 	((Npc_IsDead(Grimbald_Snapper1))
		&& (Npc_IsDead(Grimbald_Snapper2))
		&& (Npc_IsDead(Grimbald_Snapper3)))
		|| (Grimbald_PissOff == FALSE)
	{
		AI_Output			(self, other, "DIA_Grimbald_Jagd_07_01"); //Hmmm. Dobrze. Co prawda do tej pory nie bardzo mi pomog�e�, ale nie zamierzam ci� od razu skre�la�.
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Grimbald_Jagd_07_02"); //Pewnie. Ale to b�dzie troch� kosztowa�.
		B_Say_Gold (self, other, 200);
	
		Info_ClearChoices	(DIA_Grimbald_Jagd);
		Info_AddChoice	(DIA_Grimbald_Jagd, "Musz� si� zastanowi�.", DIA_Grimbald_Jagd_zuviel );
		Info_AddChoice	(DIA_Grimbald_Jagd, "W porz�dku.", DIA_Grimbald_Jagd_ja );
	};
};

func void DIA_Grimbald_Jagd_ja ()
{
	AI_Output			(other, self, "DIA_Grimbald_Jagd_ja_15_00"); //Dobrze. Oto pieni�dze.

		if (B_GiveInvItems (other, self, ItMi_Gold,200))
		{
			AI_Output			(self, other, "DIA_Grimbald_Jagd_ja_07_01"); //W porz�dku. Powiedz mi, kiedy b�dziesz chcia� si� czego� nauczy�.
			Grimbald_TeachAnimalTrophy = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Grimbald_Jagd_ja_07_02"); //Przynie� pieni�dze, a mo�e si� czego� nauczysz.
		};
	Info_ClearChoices	(DIA_Grimbald_Jagd);
};  

func void DIA_Grimbald_Jagd_zuviel ()
{
	AI_Output			(other, self, "DIA_Grimbald_Jagd_zuviel_15_00"); //Pomy�l� o tym.
	AI_Output			(self, other, "DIA_Grimbald_Jagd_zuviel_07_01"); //Skoro tak m�wisz.
	Info_ClearChoices	(DIA_Grimbald_Jagd);
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_TEACHHUNTING		(C_INFO)
{
	npc		     = 	BAU_982_Grimbald;
	nr           =  12;
	condition	 = 	DIA_Grimbald_TEACHHUNTING_Condition;
	information	 = 	DIA_Grimbald_TEACHHUNTING_Info;
	permanent	 =  TRUE;
	description	 = 	"Naucz mnie, jak powinno si� polowa�.";
};

func int DIA_Grimbald_TEACHHUNTING_Condition ()
{
	if (Grimbald_TeachAnimalTrophy == TRUE)
		{
				return TRUE;
		};
};
var int DIA_Grimbald_TEACHHUNTING_OneTime;
func void DIA_Grimbald_TEACHHUNTING_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_TEACHHUNTING_15_00"); //Naucz mnie, jak powinno si� polowa�.
	if (DIA_Grimbald_TEACHHUNTING_OneTime == FALSE)
	{
		B_StartOtherRoutine	(self,"JagdOver");
		DIA_Grimbald_TEACHHUNTING_OneTime = TRUE;
	};
	
	if 		(
				(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
			)
			{
				AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_07_01"); //Czego konkretnie chcia�by� si� dowiedzie�?
	
				Info_AddChoice		(DIA_Grimbald_TEACHHUNTING, DIALOG_BACK, DIA_Grimbald_TEACHHUNTING_BACK);
			
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("��d�o krwiopijcy",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Grimbald_TEACHHUNTING_BFSting);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Skrzyd�a krwiopijcy",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Grimbald_TEACHHUNTING_BFWing	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Usu� pazury",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Grimbald_TEACHHUNTING_Claws	);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Usu� �uwaczk�",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)),  DIA_Grimbald_TEACHHUNTING_Mandibles);
				};
				if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
				{ 
					Info_AddChoice	(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString ("Usu� p�yty pancerza z�bacza",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)),  DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
				};
			}
			else
			{
				AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_07_02"); //Wiesz ju� wszystko, czego m�g�bym ci� nauczy�.
			};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_BFSting_07_00"); //Usuni�cie ��d�a krwiopijcy nie powinno ci nastr�cza� problem�w. Wystarczy mocny n�.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_BFWing_07_00"); //Skrzyd�a krwiopijcy mo�na urwa� lub obci�� ostrym no�em.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_Claws_07_00"); //Istniej� r�ne sposoby usuwania pazur�w. W przypadku niekt�rych zwierz�t b�dziesz potrzebowa� naprawd� du�o si�y, kiedy indziej wystarczy jedynie ostry n�.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Mandibles))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_Mandibles_07_00"); //Pe�zacze i polne bestie maj� mocne �uwaczki, kt�re mo�na wyrwa� z ich czaszek za pomoc� silnego szarpni�cia.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_CrawlerPlate))
		{
			AI_Output			(self, other, "DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00"); //Pancerz pe�zacza przylega �ci�le do jego cia�a, jednak mo�na go podwa�y� jakim� p�askim narz�dziem.
		};
	Info_ClearChoices	(DIA_Grimbald_TEACHHUNTING);
};


///////////////////////////////////////////////////////////////////////
//	Info NovChase
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_NovChase		(C_INFO)
{
	npc		 = 	BAU_982_Grimbald;
	nr		 = 	3;
	condition	 = 	DIA_Grimbald_NovChase_Condition;
	information	 = 	DIA_Grimbald_NovChase_Info;

	description	 = 	"Czy nie przechodzi� t�dy jaki� nowicjusz?";

};

func int DIA_Grimbald_NovChase_Condition ()
{
	if (MIS_NOVIZENCHASE == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Grimbald_NovChase_Info ()
{
	AI_Output			(other, self, "DIA_Grimbald_NovChase_15_00"); //Czy nie przechodzi� t�dy jaki� nowicjusz?
	AI_Output			(self, other, "DIA_Grimbald_NovChase_07_01"); //Przesz�o t�dy dzisiaj wielu dziwnych ludzi, w��czaj�c tych dw�ch �artownisi�w przy kamiennym �uku.
	AI_Output			(self, other, "DIA_Grimbald_NovChase_07_02"); //Faktycznie, by� z nimi pewien nowicjusz z Klasztoru Mag�w Ognia.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Trolltot
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_Trolltot		(C_INFO)
{
	npc		 = 	BAU_982_Grimbald;
	nr		 = 	3;
	condition	 = 	DIA_Grimbald_Trolltot_Condition;
	information	 = 	DIA_Grimbald_Trolltot_Info;
	important	 = 	TRUE;

};

func int DIA_Grimbald_Trolltot_Condition ()
{
	if (Npc_IsDead(Troll_Black))
		{
				return TRUE;
		};
};

func void DIA_Grimbald_Trolltot_Info ()
{
	AI_Output			(self, other, "DIA_Grimbald_Trolltot_07_00"); //Czarny troll nie �yje. Dobra robota. Nigdy nie s�dzi�em, �e zabicie tych bestii jest w og�le mo�liwe.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Grimbald_PICKPOCKET (C_INFO)
{
	npc			= BAU_982_Grimbald;
	nr			= 900;
	condition	= DIA_Grimbald_PICKPOCKET_Condition;
	information	= DIA_Grimbald_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Grimbald_PICKPOCKET_Condition()
{
	C_Beklauen (85, 250);
};
 
FUNC VOID DIA_Grimbald_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice		(DIA_Grimbald_PICKPOCKET, DIALOG_BACK 		,DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Grimbald_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Grimbald_PICKPOCKET);
};
	
func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Grimbald_PICKPOCKET);
};



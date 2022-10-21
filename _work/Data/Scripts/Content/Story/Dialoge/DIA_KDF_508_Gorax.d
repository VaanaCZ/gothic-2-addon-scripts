///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap1_EXIT_Condition;
	information = DIA_Gorax_KAp1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gorax_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gorax_PICKPOCKET (C_INFO)
{
	npc			= KDF_508_Gorax;
	nr			= 888;
	condition	= DIA_Gorax_PICKPOCKET_Condition;
	information	= DIA_Gorax_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tego klucza b�dzie trudnym zadaniem)";
};                       

FUNC INT DIA_Gorax_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_Gorax_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gorax_PICKPOCKET);
	Info_AddChoice		(DIA_Gorax_PICKPOCKET, DIALOG_BACK 		,DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gorax_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItKe_KlosterSchatz,1);
		B_GiveInvItems (self, other, ItKe_KlosterSchatz, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_Gorax_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gorax_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_HELP		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 = 	2;
	condition	 = 	DIA_Gorax_HELP_Condition;
	information	 = 	DIA_Gorax_HELP_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gorax_HELP_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Gorax_HELP_Info ()
{
	AI_Output (self, other, "DIA_Gorax_HELP_14_00"); //Czy mog� ci w czym� pom�c?
};
///////////////////////////////////////////////////////////////////////
//	Info GOLD
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_GOLD		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  2;
	condition	 = 	DIA_Gorax_GOLD_Condition;
	information	 = 	DIA_Gorax_GOLD_Info;
	permanent	 = 	TRUE;
	description	 = 	"Przynios�em z�oto.";
};
//-----------------------------------
var int DIA_Gorax_GOLD_perm;
//-----------------------------------
func int DIA_Gorax_GOLD_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Gorax_GOLD_Info ()
{
	AI_Output (other, self, "DIA_Gorax_GOLD_15_00"); //Przynios�em z�oto.
	
	if (Npc_HasItems (other, ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output (self, other, "DIA_Gorax_GOLD_14_01"); //Rozumiem - chcesz z�o�y� Innosowi ofiar�. To bardzo dobrze, m�j synu.
		AI_Output (self, other, "DIA_Gorax_GOLD_14_02"); //Twoja ofiara zostanie wykorzystana na potrzeby klasztoru zgodnie z wol� Innosa.
	
		DIA_Gorax_GOLD_perm = TRUE; //WICHTIG
		B_GiveInvItems (other, self, ItMi_Gold, Summe_Kloster);
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_14_02"); //Co zrobi�e� z tym z�otem? Wyda�e� je? Wr��, kiedy je odzyskasz!
	};
	
};

///////////////////////////////////////////////////////////////////////
//	Info DaronsStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gorax_DaronsStatue		(C_INFO)
{
	npc		 = 	KDF_508_Gorax;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Gorax_DaronsStatue_Condition;
	information	 = 	DIA_Addon_Gorax_DaronsStatue_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mam tu pos��ek, kt�ry za spraw� Darona mia� trafi� do klasztoru.";
};

func int DIA_Addon_Gorax_DaronsStatue_Condition ()
{
	if (other.guild == GIL_NOV)
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)//ADDON
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Gorax_DaronsStatue_15_00"); //Mam tu pos��ek, kt�ry za spraw� Darona mia� trafi� do klasztoru.
	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	{
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_01"); //Szkoda, �e tak cenny przedmiot przynosi zwyk�y nowicjusz...
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_02"); //Jest to mimo wszystko �wiadectwo twego oddania sprawie Innosa.
		
		//-----------PATCH M.F.----------------------
		if B_GiveInvItems (other, self, ItMi_LostInnosStatue_Daron,1)
		{
			Npc_RemoveInvItems (self, ItMi_LostInnosStatue_Daron,1);
		};
		
		
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_03"); //Mo�esz liczy� na m� wdzi�czno��, m�odzie�cze.
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE; //WICHTIG
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Gorax_DaronsStatue_14_04"); //Pos��ek? Nie widz� tu �adnego pos��ka. Uwierz� ci, gdy go zobacz�.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_SLEEP		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  4;
	condition	 = 	DIA_Gorax_SLEEP_Condition;
	information	 = 	DIA_Gorax_SLEEP_Info;
	description	 = 	"Szukam noclegu.";
};
func int DIA_Gorax_SLEEP_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE)
	&& (other.guild == GIL_NOV) 
	{
		return TRUE;
	};
};
func void DIA_Gorax_SLEEP_Info ()
{
	AI_Output (other, self, "DIA_Gorax_SLEEP_15_00"); //Szukam noclegu.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_01"); //Tu obok jest puste ��ko. Pierwsze po prawej stronie, zaraz przy wej�ciu. Mo�esz tam spa�.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_02"); //Je�li chcesz, mo�esz skorzysta� z kt�rego� z nieu�ywanych kufr�w.
	AI_Output (self, other, "DIA_Gorax_SLEEP_14_03"); //I pami�taj - nie wchod� do komnat sypialnych mag�w. Nie wolno ci r�wnie� wchodzi� do biblioteki, chyba �e uzyskasz pozwolenie.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Aufgabe_Condition;
	information	 = 	DIA_Gorax_Aufgabe_Info;
	permanent	 =  FALSE;
	description	 = 	"Czy masz dla mnie jakie� zadanie?";
};
func int DIA_Gorax_Aufgabe_Condition ()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Aufgabe_15_00"); //Czy masz dla mnie jakie� zadanie?
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_01"); //Pracowali�cie ostatnio ci�ko, nowicjusze. A kto du�o pracuje, musi du�o je��.
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_02"); //Daj� ci klucz do spi�arni. Znajdziesz tam troch� baraniej kie�basy. Rozdziel j� sprawiedliwie pomi�dzy nowicjuszy.
	AI_Output (self, other, "DIA_Gorax_Aufgabe_14_03"); //Wr�� do mnie, kiedy ju� to za�atwisz.
	 
	CreateInvItems (self, ItKe_KlosterStore,1); 
	B_GiveInvItems (self, other, ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_RUNNING; 
	
	Log_CreateTopic (Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus (Topic_GoraxEssen,LOG_RUNNING);
	B_LogEntry (Topic_GoraxEssen,"Mistrz Gorax chce, abym wzi�� ze spi�arni barani� kie�bas� i rozdzieli� j� sprawiedliwie mi�dzy nowicjuszy. Poza mn� w klasztorze przebywa ich jeszcze trzynastu.");
};
///////////////////////////////////////////////////////////////////////
//	Info W�rste verteilt
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Wurst		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  2;
	condition	 = 	DIA_Gorax_Wurst_Condition;
	information	 = 	DIA_Gorax_Wurst_Info;
	permanent	 =  TRUE;
	description	 = 	"Rozda�em kie�bas� (uko�czenie zadania).";
};
func int DIA_Gorax_Wurst_Condition ()
{
	if (MIS_GoraxEssen == LOG_RUNNING)
	&& (Mob_HasItems ("WURSTTRUHE",ItFo_SchafsWurst) == 0)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Wurst_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Wurst_15_00"); //Rozda�em kie�bas�.
	
	if (Wurst_Gegeben >= 13)
	{
		AI_Output (self, other, "DIA_Gorax_Wurst_14_01"); //Doskonale si� spisa�e�. We� te zwoje leczenia - i wracaj do pracy.
		
		MIS_GoraxEssen = LOG_SUCCESS; 
		B_GivePlayerXP (XP_GoraxEssen);
		B_GiveInvItems (self, other, ItSc_LightHeal,2);
	}
	else 
	{
		AI_Output (self, other, "DIA_Gorax_Wurst_14_02"); //Doprawdy? Chyba nie w�o�y�e� w swoj� prac� wystarczaj�co du�o wysi�ku.
		AI_Output (self, other, "DIA_Gorax_Wurst_14_03"); //Najwyra�niej zjad�e� t� kie�bas� sam albo da�e� komu� wi�cej, ni� mu si� nale�a�o.
		AI_Output (self, other, "DIA_Gorax_Wurst_14_04"); //Pos�uchaj: poniewa� jeste� nowy - tylko i wy��cznie dlatego - tym razem ci daruj�. Zapami�taj to sobie dobrze, nowicjuszu!
		
		MIS_GoraxEssen = LOG_FAILED; 
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe 2
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Aufgabe2		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Aufgabe2_Condition;
	information	 = 	DIA_Gorax_Aufgabe2_Info;
	permanent	 =  FALSE;
	description	 = 	"Czy masz dla mnie jeszcze jakie� zadania?";
};
func int DIA_Gorax_Aufgabe2_Condition ()
{
	if ((MIS_GoraxEssen == LOG_SUCCESS)
	|| (MIS_GoraxEssen == LOG_FAILED))
	&& (Npc_IsDead (Orlan) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Aufgabe2_Info ()
{
	AI_Output (other, self, "DIA_Gorax_Aufgabe2_15_00"); //Czy masz dla mnie jeszcze jakie� zadania?
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_01"); //Tak. Jak zapewne wiesz, wyrabiamy tutaj doskona�e wino. Zajmujemy si� r�wnie� jego sprzeda��.
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_02"); //Orlan, w�a�ciciel gospody 'Pod Martw� Harpi�', zam�wi� u nas dostaw�. Uzgodnili�my cen� 240 sztuk z�ota.
	AI_Output (self, other, "DIA_Gorax_Aufgabe2_14_03"); //Zanie� Orlanowi te butelki - i nie pozw�l mu si� wykr�ci� od um�wionej kwoty.
	 
	B_GiveInvItems (self, other, ItFo_Wine,12);
	MIS_GoraxWein = LOG_RUNNING; 
	
	Log_CreateTopic (Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus (Topic_GoraxWein,LOG_RUNNING);
	B_LogEntry (Topic_GoraxWein,"Mistrz Gorax chce, abym zani�s� Orlanowi, w�a�cicielowi gospody, dwana�cie butelek wina. Mam za nie dosta� 240 sztuk z�ota.");
};
///////////////////////////////////////////////////////////////////////
//	Info Orlan
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Orlan		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  3;
	condition	 = 	DIA_Gorax_Orlan_Condition;
	information	 = 	DIA_Gorax_Orlan_Info;
	permanent	 =  TRUE;
	description	 = 	"By�em u Orlana.";
};
//----------------------------------
var int DIA_Gorax_Orlan_permanent;
//-----------------------------------
func int DIA_Gorax_Orlan_Condition ()
{
	if (MIS_GoraxWein == LOG_RUNNING)
	&& Npc_KnowsInfo (other, DIA_Orlan_Wein)
	&& (DIA_Gorax_Orlan_permanent == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Gorax_Orlan_Info ()
{
	if (Npc_HasItems (other, ItmI_Gold) >= 100)
	{
		AI_Output (other, self, "DIA_Gorax_Orlan_15_00"); //By�em u Orlana.
		AI_Output (self, other, "DIA_Gorax_Orlan_14_01"); //I co, dosta�e� 240 sztuk z�ota?
	
		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices (DIA_Gorax_Orlan);
	
		Info_AddChoice (DIA_Gorax_Orlan,"Oszuka� mnie! (oddaj 100 sztuk z�ota)",DIA_Gorax_Orlan_100);
		Info_AddChoice (DIA_Gorax_Orlan,"Mam z�oto. (oddaj 240 sztuk z�ota)",DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_14_02"); //Co zrobi�e� z tym z�otem? Wyda�e� je? Wr��, kiedy je odzyskasz!
		
	};
};
FUNC VOID DIA_Gorax_Orlan_100 ()
{
	AI_Output (other, self, "DIA_Gorax_Orlan_100_15_00"); //Wyrolowa� mnie.
	AI_Output (self, other, "DIA_Gorax_Orlan_100_14_01"); //Sprzeda�e� mu towar po ni�szej cenie? No nie. Dlaczego powierzy�em to zadanie w�a�nie TOBIE?
	AI_Output (self, other, "DIA_Gorax_Orlan_100_14_02"); //Naprawd� jeste� zupe�nie bezu�yteczny. Zejd� mi z oczu.
	
	B_GiveInvItems (other, self, ItMI_Gold, 100);
	
	MIS_GoraxWein = LOG_FAILED;
	 
	Info_ClearChoices (DIA_Gorax_Orlan);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Gorax_Orlan_240 ()
{
	AI_Output (other, self, "DIA_Gorax_Orlan_240_15_00"); //Mam z�oto.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 240)	
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_240_14_01"); //Doskonale. Przyjmij ten zw�j leczenia jako swoj� zap�at�. A teraz id�, znajd� sobie jakie� zaj�cie.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP (XP_Goraxwein);			
	}
	else
	{
		AI_Output (self, other, "DIA_Gorax_Orlan_240_14_02"); //Ju� zd��y�e� wyda� cz�� tych pieni�dzy, prawda? Do niczego si� nie nadajesz - zejd� mi z oczu!
		MIS_GoraxWein = LOG_FAILED; 
		B_GiveInvItems (other, self, ItMI_Gold, Npc_HasItems (other, ItmI_Gold));
	};
	
	Info_ClearChoices (DIA_Gorax_Orlan);
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_JOB		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  35;
	condition	 = 	DIA_Gorax_JOB_Condition;
	information	 = 	DIA_Gorax_JOB_Info;
	permanent	 =  FALSE;
	description	 = 	"Czym si� tu zajmujesz?";
};
func int DIA_Gorax_JOB_Condition ()
{
	return TRUE;
};
func void DIA_Gorax_JOB_Info ()
{
	AI_Output (other, self, "DIA_Gorax_JOB_15_00"); //Na czym polega twoja praca?
	AI_Output (self, other, "DIA_Gorax_JOB_14_01"); //Och, zajmuj� si� r�nymi rzeczami. Przede wszystkim pe�ni� funkcje zarz�dcy i skarbnika.
	AI_Output (self, other, "DIA_Gorax_JOB_14_02"); //Dogl�dam r�wnie� produkcji wina i zajmuj� si� zaopatrzeniem klasztoru w �ywno��.
	AI_Output (self, other, "DIA_Gorax_JOB_14_03"); //Je�li b�dziesz czego� potrzebowa�, znajdziesz to u mnie - oczywi�cie, za drobn� op�at�.
	
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistrz Gorax zaopatrzy mnie w klasztorze we wszystko, czego b�d� potrzebowa�.");
};
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_TRADE		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  99;
	condition	 = 	DIA_Gorax_TRADE_Condition;
	information	 = 	DIA_Gorax_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 =  TRUE;
	description	 = 	"Potrzebuj� paru rzeczy...";
};
func int DIA_Gorax_TRADE_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Gorax_JOB)
	{
		return TRUE;
	};
};
func void DIA_Gorax_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Gorax_TRADE_15_00"); //Potrzebuj� paru rzeczy...
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP f�r KDF
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KDF		(C_INFO)
{
	npc			 = 	KDF_508_Gorax;
	nr			 =  5;
	condition	 = 	DIA_Gorax_KDF_Condition;
	information	 = 	DIA_Gorax_KDF_Info;
	permanent 	 =  FALSE;
	description	 = 	"Potrzebuj� miejsca do spania.";
};
func int DIA_Gorax_KDF_Condition ()
{
	if (other.guild == GIL_KDF) 
	{
		return TRUE;
	};
};
func void DIA_Gorax_KDF_Info ()
{
	AI_Output (other, self, "DIA_Gorax_KDF_15_00"); //Potrzebuj� miejsca do spania.
	AI_Output (self, other, "DIA_Gorax_KDF_14_01"); //Po prawej stronie jest pusta komnata. Prosz�, oto klucz. W �rodku znajdziesz wszystko, czego potrzebujesz.
	
	B_GiveInvItems (self, other,ItKe_KDFPlayer,1);
	Wld_InsertItem (ItPo_Perm_Mana,"FP_ITEM_KDFPLAYER");
};
//########################################################################
//##
//##		Kapitel 2
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap2_EXIT_Condition;
	information = DIA_Gorax_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap2_EXIT_Condition()
{
	if (kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gorax_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//########################################################################
//##
//##		Kapitel 3
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap3_EXIT_Condition;
	information = DIA_Gorax_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap3_EXIT_Condition()
{
	if (kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info KillPedro
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KILLPEDRO		(C_INFO)
{
	npc		 = 	KDF_508_Gorax;
	nr		 = 	3;
	condition	 = 	DIA_Gorax_KILLPEDRO_Condition;
	information	 = 	DIA_Gorax_KILLPEDRO_Info;
	important	 = 	TRUE;
};

func int DIA_Gorax_KILLPEDRO_Condition ()
{
	if (Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void DIA_Gorax_KILLPEDRO_Info ()
{
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_00"); //Zaczekaj, najemniku, musz� z tob� porozmawia�.
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_15_01"); //Czego chcesz?
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_02"); //Klasztor jest w bardzo trudnej sytuacji.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_03"); //Teraz panuje tu atmosfera nieufno�ci. W dodatku ta sprawa z Pedrem, to jest dla nas bardzo...
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_04"); //Mam dla ciebie zlecenie. Jeste� jedyn� osoba, kt�ra mo�e nam pom�c, poniewa� nie nale�ysz do Bractwa Ognia.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_14_05"); //Musz� ci� jednak ostrzec. Je�li przyjmiesz moje zlecenie, b�dziesz je musia� wykona�. Kiedy ju� dowiesz si�, o co chodzi, nie b�dziesz mia� wyboru. Czy wszystko jasne?
	
	Info_ClearChoices	(DIA_Gorax_KILLPEDRO);
	Info_AddChoice	(DIA_Gorax_KILLPEDRO, "Zapomnij. To dla mnie zbyt ryzykowne.", DIA_Gorax_KILLPEDRO_nein );
	Info_AddChoice	(DIA_Gorax_KILLPEDRO, "Powiedz mi, co to za zadanie.", DIA_Gorax_KILLPEDRO_ja );
};
func void DIA_Gorax_KILLPEDRO_nein ()
{
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_nein_15_00"); //Zapomnij. To dla mnie zbyt ryzykowne.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_nein_14_01"); //Dobrze. Wobec tego, zapomnijmy o ca�ej sprawie.
	AI_StopProcessInfos (self);
};

func void DIA_Gorax_KILLPEDRO_ja ()
{
	AI_Output			(other, self, "DIA_Gorax_KILLPEDRO_ja_15_00"); //Powiedz mi, co to za zadanie.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_01"); //Dobrze. Tylko s�uchaj uwa�nie, bo drugi raz tego nie powt�rz�.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_02"); //Serpentes chce, �eby� znalaz� Pedra i zabi� go za zdrad�.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_03"); //Zap�at� dostaniesz, jak tylko wykonasz zadanie.
	AI_Output			(self, other, "DIA_Gorax_KILLPEDRO_ja_14_04"); //Nigdy tego nie powiedzia�em. A ty te� nigdy nic nie s�ysza�e�, jasne?

 	B_LogEntry (TOPIC_TraitorPedro, "Gorax przekaza� mi, �e Serpentes chce, abym zabi� zdrajc� Pedra, je�li gdzie� go spotkam.");
	
	B_GivePlayerXP (XP_Gorax_KILLPEDRO_GotMission);
	MIS_Gorax_KillPedro = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

//########################################################################
//##
//##		Kapitel 4
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap4_EXIT_Condition;
	information = DIA_Gorax_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap4_EXIT_Condition()
{
	if (kapitel == 4)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//########################################################################
//##
//##		Kapitel 5
//##
//########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Gorax_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_508_Gorax;
	nr          = 999;
	condition   = DIA_Gorax_Kap5_EXIT_Condition;
	information = DIA_Gorax_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gorax_Kap5_EXIT_Condition()
{
	if (kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gorax_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};




 































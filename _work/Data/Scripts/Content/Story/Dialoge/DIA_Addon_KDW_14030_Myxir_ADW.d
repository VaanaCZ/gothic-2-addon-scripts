
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14030_Addon_Myxir_ADW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14030_Addon_Myxir_ADW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_ADWHello_Condition;
	information	 = 	DIA_Addon_Myxir_ADWHello_Info;

	description	 = 	"Objevili jste n�co nov�ho?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //N�jak� nov� objevy?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //Stavitel� tohoto d�vn�ho m�sta m� fascinuj�!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //�koda �e jejich jazyk je stejn� mrtv� jako oni.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //(rozv�n�) Zachr�nit je mohly pouze mocn� ob�ady a vyvol�vac� ritu�ly, kter� ovl�dali.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Vyvol�vac� ritu�ly?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Stavitel� byli siln� napojeni na duchovn� sv�t.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Pokud jsem to dob�e pochopil, v��ili, �e jsou v neust�l�m kontaktu se sv�mi p�edky.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Pravideln� po��dali ob�ady, p�i nich� vyvol�vali duchy sv�ch p�edk� a ��dali je o radu a osv�cen�.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "A jak to vyvol�v�n� duch� funguje?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Nemrtv�, kter� zn�m, toho obvykle moc nenamluv�.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //A jak to vyvol�v�n� duch� funguje?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Str�ci smrti m�li zvl�tn� formule, kter�mi ovl�dali duchy.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Ale n�pisy, kter� jsem tu na�el, m� trochu matou. Jen vz�cn� v nich najdu jasnou odpov�� na sv� ot�zky.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //Nemrtv�, kter� zn�m, nikdy nem�li mnoho co ��ct.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Stavitel� ale nevytv��eli bezduch� nemrtv� jako zombie nebo podobn� stv�ry.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //�lo o duchy velk�ch v�le�n�k�, kn�z� a vl�dc�.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Zat�m nepochybuji, �e skute�n� existovali.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_PermADW_Condition;
	information	 = 	DIA_Addon_Myxir_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kdybych n�kdy n�jak�ho ducha potkal, d�m ti v�d�t.";
};
func int DIA_Addon_Myxir_PermADW_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //A� uvid�m ducha, d�m ti v�d�t.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(sm�je se) Ano, na tom trv�m.
};
///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistTafel_Condition;
	information	 = 	DIA_Addon_Myxir_GeistTafel_Info;

	description	 = 	"Pos�l� m� Saturas.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition ()
{
	if (Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistTafel_Info ()
{
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Pos�l� m� Saturas.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Havran se dostal do chr�mu a zablokoval port�l zevnit�.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas si mysl�, �e informaci o tom chr�mu z�skal od ducha.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(zara�en�) P�i Adanovi! 
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Ur�it� vyvolal velekn�ze Khardimona a ptal se ho na cestu do chr�mu.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Podle z�znam� je jeho hrob v jeskyn�ch pod pevnost�.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //A ty ud�l� to sam�.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Ale Khardimona u� se d�l pt�t nem��e�.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //Hrob prince-v�le�n�ka Quarhodrona by m�l b�t na z�pad� �dol�.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Bude� ho muset naj�t a Quarhodrona probudit.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //Tyto n�pisy hovo�� o tom, �e ducha m��e vyvolat pouze ten, kdo v��� v Adana.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //V�n� mysl�, �e to bude fungovat?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //U� jsem p�e�etl spoustu ��len�ch bl�bol�.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Nap��klad z�znamy Y'Beriona, v�dce Sp��ova bratrstva.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Ale autorovi T�CHTO z�znam� v���m ka�d� slovo.
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "To mysl� v�n�?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Pro� Quarhodron? Pro� ne velekn�z Khardimon?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Bratrstvo Sp��e nehl�salo JENOM l�i.", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Pro� Quarhodron? Pro� ne velekn�z Khardimon?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Havran t�m vyvol�v�n�m Khardimonovu hrobku znesv�til. To mus�me br�t v potaz.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Budeme se muset poohl�dnout po jin�m duchovi.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //Sp��ovo bratrstvo ne���ilo POUZE l�i. Sp�� opravdu existoval.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //Ale jejich l�i nebyly tak nepravd�podobn� jako samotn� jejich slova.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Byli tak zmaten�, �e si to ani nedovede� p�edstavit. Kou�ili moc t� sv� tr�vy z ba�in.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Slova na t�to kamenn� tabulce hovo�� v�n� a proz�rav�. A to m� utvrzuje v p�esv�d�en�, �e TENTO �lov�k hovo�il pravdu.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //To opravdu mysl� v�n�?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Chci pro�et�it ka�dou mo�nost.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Je to jedin� p��le�itost, jak se setkat s jedn�m ze stavitel� � i kdy� je to pouze duch. Tak pro� j� nevyu��t.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Havran to ka�dop�dn� dok�zal.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "�ekn�me, �e bych cht�l toho ducha vyvolat...", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Co mus�m ud�lat, abych toho ducha vyvolal?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Quarhodron�v hrob najde� na z�pad� �dol�.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Jeho ducha lze vyvolat slovy str�c� smrti, kter� jsem ti tu napsal.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //To je v�echno. Te� zb�v� u� jen naj�t hrob.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Hodn� �t�st�, synu.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir chce, abych probudil ducha prince Quarhodrona a po��dal ho o radu. Dal mi svitek se zakl�nadlem, kter� m�m nahlas p�e��st u Quarhodronova hrobu na z�pad�."); 

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistPerm_Condition;
	information	 = 	DIA_Addon_Myxir_GeistPerm_Info;

	description	 = 	"M��e� mi je�t� zopakovat, co to bylo s t�m v�le�nick�m princem Quarhodronem?";
};

func int DIA_Addon_Myxir_GeistPerm_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistPerm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //M��e� mi je�t� zopakovat, jak to bylo s princem Quarhodronem?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Mus� naj�t jeho hrob a slovy str�c� smrti vyvolat jeho ducha.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //Ta slova jsem ti tady zapsal. Sta�� je nahlas p�e��st.
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Myxir_TalkedToGhost_Info;

	description	 = 	"Hovo�il jsem s Quarhodronem.";
};
func int DIA_Addon_Myxir_TalkedToGhost_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //Hovo�il jsem s Quarhodronem.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(nad�en�) Tak�e jsi ho doopravdy probudil z mrtv�ch?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //To je neuv��iteln�. Ti stavitel� m� ��m d�l v�c p�ekvapuj�.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Kdo v�, co mohli dok�zat, kdyby je�t� existovali.
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //A co ten duch pov�dal?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Dal mi n�co, co mi pom��e dostat se do Adanova chr�mu.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Pak b� rovnou za Saturasem. Tv� informace ho ur�it� budou zaj�mat.

		B_LogEntry (TOPIC_Addon_Quarhodron,"M�l bych Saturasovi ozn�mit, �e jsem probudil Quarhodrona."); 
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nau� m� tomu jazyku.";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition ()
{
	if (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)	
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_ADW_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};	
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,DIALOG_BACK,DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};


















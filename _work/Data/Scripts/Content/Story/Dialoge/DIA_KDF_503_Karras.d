///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello 		(C_INFO)
{
	npc			= KDF_503_Karras;
	nr          = 1;
	condition	= DIA_Karras_Hello_Condition;
	information	= DIA_Karras_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
func int DIA_Karras_Hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Karras_Hello_Info ()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Co pro tebe mohu ud�lat, novici?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Co pro tebe mohu ud�lat, brat�e?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Do t�chto komnat zav�taj� ctihodn� Innosovi v�le�n�ci jen z��dka.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Co pro tebe mohu ud�lat?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(ned�v��iv�) Co tady d�l�?
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Mission_Condition;
	information	 = 	DIA_Karras_Mission_Info;
	permanent    =  FALSE;
	description	 = 	"P�i�el jsem si p�e��st n�jak� svat� texty.";
};
func int DIA_Karras_Mission_Condition ()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Mission_Info ()
{
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //P�i�el jsem si p�e��st n�jak� svat� texty.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Rozum�m. Jestli se ti poda�� naj�t mezi n�ro�n�m studiem n�jak� voln� �as, stav se za mnou.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Je tady je�t� jedna z�le�itost, ke kter� bych pot�eboval diskr�tn�ho novice.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Aufgabe_Condition;
	information	 = 	DIA_Karras_Aufgabe_Info;
	permanent    =  FALSE;
	description	 = 	"M� pro m� n�jak� �kol?";
};
func int DIA_Karras_Aufgabe_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Karras_Mission)
	{
		return TRUE;
	};
};
func void DIA_Karras_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //M� pro m� n�jak� �kol?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Ano. T�k� se to toho bl�zniv�ho Ignaze. �ije v Khorinidu a experimentuje s r�zn�mi lektvary a l��iv�mi odvary. Ale tak� s kouzly a magi�.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //A to m� tr�p�. Pt�m se s�m sebe, jestli se jeho magie neprotiv� Innosovi.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Abych se mohl p�esv�d�it, pot�ebuji n�jak� jeho kouzeln� svitky.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Chci, abys �el do m�sta a z�skal pro m� t�i jeho magick� svitky.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Ale nikomu ani muk - je to jasn�?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Jasn�.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Tady m� 150 zlat�ch. To by m�lo pokr�t tv� v�daje.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Mistr Karras m� poslal do m�sta, kde mu m�m obstarat t�i svitky s kouzly, kter� vyr�b� a prod�v� Ignaz.");

	B_GiveInvItems (self, other, ItMi_Gold,150);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Success_Condition;
	information	 = 	DIA_Karras_Success_Info;
	permanent    =  FALSE;
	description	 = 	"Tady jsou ty magick� svitky, kter� jsi cht�l.";
};
func int DIA_Karras_Success_Condition ()
{	
	if (MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems (other, ItSc_Charm) >= 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_Success_Info ()
{
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Tady jsou ty magick� svitky, kter� jsi cht�l.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Velmi dob�e, m�j mlad� p��teli.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //Ale te� je na�ase, aby ses v�noval sv�m studi�m.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Za odm�nu si vezmi tenhle �arovn� svitek.
	
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP (XP_KarrasCharm);
	B_GiveInvItems (other, self, ItSc_Charm,3);
	B_GiveInvItems (self, other, ItSc_SumWolf,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Trade_Condition;
	information	 = 	DIA_Karras_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Uka� mi sv� zbo��.";
	trade		 =  TRUE; 
};
func int DIA_Karras_Trade_Condition ()
{	
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //Uka� mi sv� zbo��.
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_JOB_Condition;
	information	 = 	DIA_Karras_JOB_Info;
	permanent    =  FALSE;
	description	 = 	"Co m� p�esn� na starosti?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //Co m� p�esn� na starosti?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //M�m �kolem je cvi�it m�gy v um�n� sf�rick� manifestace.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Co to znamen�?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //No, u��m je, jak vyvol�vat stvo�en� z jin�ch sf�r.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //V�t�inou se tomu ��k� prost� vyvol�v�n�, i kdy� tenhle v�raz naprosto nesta�� k pops�n� um�n� stvo�en� slu�ebn�ka.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Nav�c m�m n�kolik zaj�mav�ch svitk� s kouzly, kter� u Goraxe nenajde�.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Ale nab�z�m je jen �len�m na�eho ��du.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistr Karras z kl�tera m� m��e z�sobit svitky s kouzly - pokud se tedy stanu m�gem ohn�.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr 			 =  10;
	condition	 = 	DIA_Karras_TEACH_Condition;
	information	 = 	DIA_Karras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"R�d bych se od tebe n��emu p�iu�il (vytvo�it runy).";
};

func int DIA_Karras_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Karras_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //U� m�.
	
		Info_ClearChoices   (DIA_Karras_TEACH);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
		{
			Info_AddChoice 		(DIA_Karras_TEACH,B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
		{
			Info_AddChoice	    (DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Karras_TEACHSummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Karras_TEACH_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Karras_TEACH_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Karras_TEACH_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
		if 	(abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //V tuhle chv�li nen� nic, co by ses ode m� mohl nau�it.
		}
		else
		{
			Info_AddChoice 		(DIA_Karras_TEACH,DIALOG_BACK,DIA_Karras_TEACH_BACK);
		};

};
FUNC VOID DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices   (DIA_Karras_TEACH);
};
FUNC VOID DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};
FUNC VOID DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);	
};
FUNC VOID DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE4_Condition;
	information	 = 	DIA_Karras_CIRCLE4_Info;
	permanent	 = 	TRUE;
	description	 = 	"Cht�l bych se nau�it �tvrt� kruh magie.";
};
func int DIA_Karras_CIRCLE4_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE4_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Cht�l bych se nau�it �tvrt� kruh magie.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Dobr�. V�echna znamen� jsou spln�na. Vstup nyn� do �tvrt�ho kruhu, aby se v tob� probudila s�la nov� magie.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Pro�el jsi dlouhou cestou a Innos bude i nad�le osv�tlovat tvou stezku.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Je�t� st�le nen� v�e hotovo.
	};
};
/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE5_Condition;
	information	 = 	DIA_Karras_CIRCLE5_Info;
	permanent	 = 	TRUE;
	description	 = 	"Cht�l bych se nau�it p�t� kruh magie.";
};
func int DIA_Karras_CIRCLE5_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE5_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Cht�l bych se nau�it p�t� kruh magie.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //V tom p��pad� nyn� vstup do p�t�ho kruhu magie. Bude� vl�dnout je�t� siln�j�� magi� ne� kdykoliv p�edt�m.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //U��vej jej� moc s rozvahou, brat�e - temnota je st�le p��li� siln� a na�i nep��tel� t�.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Do �est�ho a nejvy���ho kruhu magie t� doprovodit nemohu. A� p�ijde spr�vn� �as, zasv�t� t� s�m Pyrokar.
			
			B_LogEntry (Topic_KlosterTeacher,"Mistr Pyrokar m� zasv�t� do �est�ho kruhu magie.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //�as je�t� nedozr�l.
	};
};
//#####################################################################
//##
//##		Kapitel 2
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##		Kapitel 3
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_ChasePedro_Condition;
	information	 = 	DIA_Karras_ChasePedro_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};

func int DIA_Karras_ChasePedro_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Nesm� ztr�cet �as, brat�e. Mus� dohonit Pedra a vr�tit kl�teru Innosovo oko.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Pokud nebude Oko navr�ceno, budeme v�ichni ztraceni.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Co tady d�l�? Nem�l bys b�t na cest� za t�m bezp�te�n�m zr�dcem Pedrem?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Pozd�ji. Nejprve si mus�m n�co za��dit.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Nedostane se nijak daleko.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Pozd�ji. Nejprve si mus�m n�co za��dit.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Uv�domuje� si v�bec, co tahle ztr�ta pro kl�ter znamen�? Innosovo oko je mocn� zbra�.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nikdo nem��e tu�it, co s t�m amuletem nep��tel zam��l�, ale n�co rozhodn� pl�nuje a my mu to mus�me p�ekazit.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Tak�e se okam�it� vydej na cestu za t�m zlod�jem!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Nedostane se nijak daleko.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //To douf�m, pro tvoje vlastn� dobro. Pokud by m�l uniknout jen proto, �e se tady poflakuje�, s�m t� dokopu p�ed tribun�l.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //Z �eho bys m� obvinil?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //Ze spol�ov�n� s nep��telem. Nepot�ebuje� velkou fantazii, aby sis dok�zal p�edstavit, jak� by t� za to potkal trest.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Tak�e u� neztr�cej �as, proto�e tv�j dal�� osud bude z�viset na tom, za jak�ch okolnost� se p��t� setk�me.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_NeedInfo_Condition;
	information	 = 	DIA_Karras_NeedInfo_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_Karras_NeedInfo_Condition ()
{	
	if (Npc_KnowsInfo  (other ,DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Karras_NeedInfo_Info ()
{
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //V� v�echno, co pot�ebuje�. A� u� jsi na cest�!
	
	AI_StopProcessInfos (self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	1;	//damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition	 = 	DIA_Karras_InnosEyeRetrieved_Condition;
	information	 = 	DIA_Karras_InnosEyeRetrieved_Info;
	permanent	 = 	FALSE;
	description	 =	"P�inesl jsem zp�tky Innosovo oko.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition ()
{	
	if	(KAPITEL == 3)
	&& 	(MIS_NOVIZENCHASE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Karras_InnosEyeRetrieved_Info ()
{
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //P�inesl jsem zp�tky Innosovo oko.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //To mi spadl k�men ze srdce, �e se ti poda�ilo Innosovo oko nep��teli uzmout.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Ale nebezpe�� nebylo odvr�ceno. Zlo kuje dal�� pl�ny a pokra�uje s neb�valou agresivitou.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //To u� mi tak� do�lo.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Ned�lej si ze m� �pr�ouchlata. Situace je v�n�, velice v�n�, a nem��eme v�d�t, komu je mo�n� d�v��ovat.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //Nep��teli se u� poda�ilo uv�st v poku�en� novice Pedra a m��e se mu to poda�it u mnoh�ch dal��ch.

	B_GivePlayerXP (XP_AMBIENT);
};
	
///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_Perm   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 5;
	condition   = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent   = TRUE;
	description = "Jak pokra�uj� tv� studia?";
};
FUNC INT DIA_Karras_KAP3_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
		{
			return TRUE;
		};	
};
FUNC VOID DIA_Karras_KAP3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //Jak pokra�uj� tv� studia?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //Poda�ilo se mi p�ij�t na n�co ohledn� P�tra��.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //A co to m� b�t?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Jsou zcela jasn� d�monick�ho p�vodu. Tedy p�inejmen��m jsou - nebo alespo� byli - pod vlivem d�mon�.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Kdy� na n� naraz�, bu� opatrn�.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Jak nov�torsk� p��stup.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Je mi l�to, ale nem�m dost materi�l�, abych mohl vyvozovat p�esn�j�� stanoviska.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Ale kdyby se ti poda�ilo z�skat od nich n�co, co bych mohl podrobit zkoum�n�...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras pot�ebuje n�co, co bylo v p��m�m kontaktu s p�tra�i. Jen tak bude moci pokra�ovat ve sv�ch v�zkumech."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Uvid�m, co se d� d�lat.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Mohl by do toho b�t n�jak�m zp�sobem zapleten� Sp��?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"A jak� materi�ly bys pot�eboval?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Je�t� st�le pracuji na interpretaci d�kaz� souvisej�c�ch s P�tra�i.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Samoz�ejm� - jakmile n�co zjist�m, d�m ti okam�it� v�d�t.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //Nep��tel m� mnoho tv���. Je velmi obt�n� ur�it, kter� z nich p�edstavuje pro kl�ter nejv�t�� nebezpe��.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Mohl by do toho b�t n�jak�m zp�sobem zapleten� Sp��?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //Ten p��b�h o Sp��ovi jsem sly�el. Ale tak obecn�, �e k tomu nem�m co ��ci.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //D�mon� je bezpo�et a zapleten� do toho m��e b�t kter�koliv z nich.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Tak�e chce�, abych ti p�inesl mrtvolu?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //Ne, copak ses zbl�znil? Nebezpe��, kter� by p�edstavovala p��tomnost d�monick�ho stvo�en� za zdmi kl�tera, by bylo p��li� velk�.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Bude sta�it, kdy� najde� n�jak� p�edm�ty, kter� jsou pro tyto tvory typick�.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Zbytky d�monick� aury, kter� je obklopuje, by m�ly pro bli��� zkoum�n� sta�it.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //A jak� materi�ly bys pot�eboval?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Co j� v�m - n�jak� p�edm�ty, kter� jsou pro tato stvo�en� typick�.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Tak�e ty chce�, abych ti p�inesl mrtvolu?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Pokus�m se.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //To by bylo opravdu v�born�. Mezit�m se budu v�novat sv�mu vlastn�mu v�zkumu.
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************

INSTANCE DIA_Karras_HaveBook   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent   = FALSE;
	description = "Z�skal jsem Almanach posedl�ch.";
};
FUNC INT DIA_Karras_HaveBook_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems (hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
var int KarrasGotResearchDMTBook_Day;
FUNC VOID DIA_Karras_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //M�m u sebe Almanach posedl�ch. Mo�n� by se ti mohl k n��emu hodit.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Uka� mi ho.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Ano, to by m�lo sta�it. Prozkoum�m tu knihu.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Ale jedn�m si u� jsem jist�.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //P�tra�i jsou podle m� zcela zvr�cen� forma �ivota vytvo�en� Beliarem.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Ta stvo�en� jsou ��ste�n� d�monick�ho a ��ste�n� lidsk�ho p�vodu.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Ale po��d nedok�u p�esn� ur�it, jestli stoj�me p�ed typickou duchovn� posedlost�, nebo �ist� fyzickou mutac�.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //P�ij� pozd�ji. Pak budu ur�it� v�d�t n�co v�c.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras pro sv�j dal�� v�zkum pot�ebuje Almanach posedl�ch. Vr�t�m se k n�mu pozd�ji."); 
	KarrasGotResearchDMTBook_Day = Wld_GetDay(); 
	B_GivePlayerXP (XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************

INSTANCE DIA_Karras_ResearchDMTEnd   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent   = TRUE;

	description = "U� jsi p�i�el na n�co nov�ho ohledn� p�tra��?";
};
FUNC INT DIA_Karras_ResearchDMTEnd_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //U� jsi p�i�el na n�co nov�ho ohledn� P�tra��?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Ano. U� v�m, kdo nebo co jsou P�tra�i skute�n� za�.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Nenap�nej m�!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Kdysi to b�vali lid�, jako ty nebo j�. Ud�lali osudnou chybu, kdy� zasv�tili sv�j �ivot ne�ist� magii velice mocn�ho arcid�mona.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Pod vlivem tohoto arcid�mona a velice mocn�ch drog �ili pouze proto, aby mu slou�ili, a� se z nich staly jen pouh� st�ny sebe sama.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Dnes nejsou nic v�c ne� n�stroje zla bez vlastn� v�le, a nikdy nep�estanou lovit n�sledovn�ky Innose.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Mus�me b�t opatrn�. Zd� se sice, �e se zat�m vyh�baj� t�mto posv�tn�m Innosov�m s�n�m.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Ale pokud bude jejich moc nad�le r�st, netu��m, jestli tu budeme v bezpe��.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //D�ky. To bylo v�n� povzbudiv�.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Opravdu? To ov�em nastoluje dal�� ot�zky. Nap��klad, k�m byli p�edt�m a jak� arcid�mon z nich ud�lal to, ��m jsou dnes?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //M�m jist� podez�en�. Cel� to zn� jako bratrstvo Sp��e. Zn�m ty chlap�ky.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Douf�m, �e v�, do �eho se to zapl�t�. D�vej na sebe pozor, brat�e.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Abych nezapomn�l. Tady je tv�j almanach. U� ho nebudu pot�ebovat.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Karrasovy studie byly �sp�n�. Vypad� to, �e p�tra�i jsou n�jak spojeni se Sp��ov�m bratrstvem."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Pracuji na tom. P�ij� pozd�ji.
	};
};

//********************************************************************
//	Prot_BlackEye	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_Prot_BlackEye   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent   = TRUE;

	description = "Existuje zp�sob, jak se ochr�nit p�ed ment�ln�mi �toky p�tra��?";
};
FUNC INT DIA_Karras_Prot_BlackEye_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Existuje zp�sob, jak se ochr�nit p�ed ment�ln�mi �toky P�tra��?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Jist�. Amulet s kamenem z posv�tn� p�dy by m�l m�t po�adovan� ochrann� efekt.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Bohu�el nem�m dostatek takov�ch kamen�.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Jsou z nich postaveny n�kter� ze svatyn�, kter� jsme vybudovali.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Dobr�. V�ak j� u� n�jak� n�kde spla��m.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Ano, ud�lej to. Ale a� t� ani nenapadne n�jak po�kodit ty svatyn�, sly��?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras m� m��e p�ed ment�ln�mi �toky p�tra�� trochu ochr�nit. Pot�ebuje k tomu ale k�men z posv�tn� p�dy, jak� lze z�skat v n�kter�ch svatyn�ch."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Nem�m tu�en�. St�le toho v�m p��li� m�lo, ne� abych znal odpov��. Zeptej se m� pozd�ji.
	};
};

//********************************************************************
//	KarrasBlessedStone	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_KarrasBlessedStone   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;

	description = "M�m n�kolik kamen� z posv�cen� p�dy.";
};
FUNC INT DIA_Karras_KarrasBlessedStone_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_HasItems (other,ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING)
	{
		return TRUE;
	};	
};
var int KarrasMakesBlessedStone_Day;
FUNC VOID DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //M�m n�kolik kamen� z posv�cen� p�dy.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //V�born�. Douf�m, �e v�echny svatyn� jsou st�le na sv�ch m�stech.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Dobr�. Ud�l�m ti ochrann� amulet proti �ern�mu pohledu P�tra��.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Dej mi trochu �asu. D�m se hned do pr�ce.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras mi d� amulet, kter� m� ochr�n� p�ed ment�ln�mi �toky p�tra��. Velmi mi to usnadn� �ivot."); 
	B_GivePlayerXP (XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos (self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************

INSTANCE DIA_Karras_ItAm_Prot_BlackEye_Mis   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent	 = 	TRUE;

	description = "Tak co je s t�m ochrann�m amuletem, cos mi sl�bil?";
};
var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
FUNC INT DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //Tak co je s t�m ochrann�m amuletem, cos mi sl�bil?
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //Jsem hotov. Tady je, pod�vej. Vypad� nakonec n�dhern�.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Nos ho st�le u sebe a P�tra�i t� nebudou moci st�hnout do sv� du�evn� propasti.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //D�kuji.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mi dal amulet, kter� m� ochr�n� p�ed �ern�mi pohledy p�tra��."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Trp�livost. Je�t� na tom pracuji.
	};
};

//#####################################################################
//##
//##		Kapitel 4
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit	
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##		Kapitel 5
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Karras_PICKPOCKET (C_INFO)
{
	npc			= KDF_503_Karras;
	nr			= 900;
	condition	= DIA_Karras_PICKPOCKET_Condition;
	information	= DIA_Karras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen (49, 35);
};
 
FUNC VOID DIA_Karras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Karras_PICKPOCKET);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_BACK 		,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};
	
func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};



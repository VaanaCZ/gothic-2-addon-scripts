///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"Jeste� rybakiem?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Jeste� rybakiem?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //Jak na to wpad�e�?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Mo�e po prostu zostawisz mnie w spokoju, co?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Nie mam nic do ciebie, ale ostatnio mia�em sporo nieprzyjemnych star� ze stra��, wi�c rozumiesz...
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Nie oceniaj mnie zbyt pochopnie. Po prostu jestem w pod�ym nastroju. K�opoty ze stra��, rozumiesz...
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"K�opoty ze stra��?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //K�opoty ze stra��?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Ci dranie regularnie mnie nachodz� i zabieraj�, co im si� �ywnie podoba!
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //W ostatnim tygodniu zabrali mi ca�y po��w. Powiedzieli, �e to "dla wsp�lnego dobra"!
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //Wiem, �e jeste�my zdani na w�asne si�y od czasu, gdy farmerzy przestali handlowa�.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //Niekt�rzy jedz� porz�dny posi�ek raz na tydzie�. Nic dziwnego, �e stra� zabra�a mi wszystkie ryby.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Ale je�li tak dalej p�jdzie, to wkr�tce sam zaczn� g�odowa�.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Daj mi swoje ryby.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Mo�e b�d� m�g� ci jako� pom�c.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Rozmawia�e� o tym z paladynami?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Rozmawia�e� o tym z paladynami?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //�artujesz chyba! A co ich obchodzi, �e taki chudopacho�ek, jak ja, ma problemy ze stra��?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Daj mi swoje ryby.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //Wiedzia�em. Kolejny z tych siepaczy.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Obawiam si�, �e przyszed�e� troch� za p�no. Twoi kompani zabrali wszystko ju� wczoraj.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //My�l�, �e ju� czas na ciebie.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Mo�e b�d� m�g� ci jako� pom�c.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Bo ja wiem... Musia�by� zna� kogo� w stra�y, kto ma doj�cie do paladyn�w...
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Sami paladyni raczej nie KUPI� ode mnie ryb.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Zobacz�, co da si� zrobi�.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Rybak Farim ma k�opoty ze stra��, kt�ra zabiera mu zbyt wiele ryb, by m�g� zarobi� na �ycie. Musz� znale�� w stra�y kogo�, kto ma wp�yw na paladyn�w, i pom�c Farimowi."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"Wiem ju�, jak rozwi�za� twoje problemy.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //Wiem ju�, jak rozwi�za� twoje problemy.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //Zamieniam si� w s�uch.

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Jestem tu od niedawna i ma�o mog�.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Ale znam kogo�, kto m�g�by ci pom�c.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, kwatermistrz paladyn�w, powiedzia�, �e ch�tnie wys�ucha twojej skargi.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //My�lisz, �e powie stra�nikom, by zostawili mnie w spokoju?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Tak powiedzia�.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Dobrze. Wielkie dzi�ki. Niestety, nie mog� ci si� odwdzi�czy�. Chocia�...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //Ten dziwny b��kitny kamie� znalaz�em kiedy� na wyspie w pobli�u Khorinis.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Nie s�dz�, by by� wiele wart, ale kto� taki jak ty na pewno znajdzie dla niego zastosowanie.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Mo�esz mi co� powiedzie� o zaginionych ludziach?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Mo�esz mi co� powiedzie� o zaginionych ludziach?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //M�j kumpel, William, zadawa� si� ostatnio z podejrzanymi typkami i do czego to doprowadzi�o?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Pewnego dnia nie przyszed� do pracy i od tego czasu nikt go ju� nie widzia�.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"William te� zagin��?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //William te� zagin��?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //Zgadza si�. By� zwyk�ym rybakiem, cho� nie da si� ukry�, �e czasami zdrowo mu odbija�o.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Nie powinien by� si� brata� z tymi obwiesiami.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "Co masz na my�li?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Jestem pewien, �e pr�dzej czy p�niej wr�ci do domu.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "A co takiego robi�?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Kiedy widzia�e� go po raz ostatni?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //A co takiego robi�?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William chyba kr�ci� jakie� lewe interesy z tymi rzezimieszkami.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //S�dz�, �e sprzedawa� im jakie� nielegalne towary.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, wei� ich nicht, was er stattdessen f�r sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //Co masz na my�li?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Nie wiem, kim s�, ani czego szukaj� w Khorinis.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Wiem tylko, gdzie si� spotykali z Williamem.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Widzia�em go tam tylko raz i to przypadkiem, podczas �owienia ryb.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Gdzie si� spotykali?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Gdzie si� spotykali?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Po przeciwnej stronie przystani, na p�nocy, le�y ma�a zatoka.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //Mo�na si� tam dosta� wp�aw lub ��dk�.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //W zatoce znajduje si� pla�a, na kt�rej widzia�em tych przemytnik�w.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kolega rybaka Farima, William, zagin��. Podobno William spotyka� si� z jakimi� rzezimieszkami w zatoce na p�noc od portu."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "Chyba us�ysza�em ju� wystarczaj�co wiele.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Kiedy widzia�e� go po raz ostatni?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Nie dalej jak kilka dni temu.

	Info_AddChoice	(DIA_Addon_Farim_William, "Mo�e po prostu wyp�yn�� na po��w?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Mo�e po prostu wyp�yn�� na po��w?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //Niemo�liwe. Jego ��d� jest wci�� zacumowana na przystani.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Jestem pewien, �e pr�dzej czy p�niej wr�ci do domu.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //Nie s�dz�. Zbyt d�ugo ju� go nie ma.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Boj� si�, �e kt�rego� dnia morze wyrzuci na brzeg jego cia�o.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Chyba us�ysza�em ju� wystarczaj�co wiele.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Nie przejmuj si� tym. W�tpi�, by� go znalaz�.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"I jak tam ryby? Bior�?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //I jak tam ryby? Bior�?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Ech, nie udawaj, �e ci� to interesuje!
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //Bywa�o lepiej. Jest jak jest. Za ma�o by �y�, za du�o, by umrze�.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Wr�ci�e�!
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //S�ysza�e� co� o Williamie?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Nie �yje.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //Spodziewa�em si� takich wie�ci.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Dzi�ki, �e wr�ci�e�, by mi to powiedzie�.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //P�jd� do knajpy i za cz�� zdobyczy Williama wypij� za jego pami��. Wiem, �e on post�pi�by tak samo, gdybym to ja zgin��.
};







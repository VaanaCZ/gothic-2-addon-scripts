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

	description	 = 	"Ty jsi ryb��?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Ty jsi ryb��?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //(cynicky) Jak jsi na to p�i�el?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Pro� m� prost� nem��e� nechat na pokoji?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Neber si to osobn�, ale posledn� dobou jsem s domobranou nem�l zrovna �t�st�.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Neber si to osobn�, ale posledn� dobou jsem nem�l moc �t�st�. M��e za to domobrana.
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

	description	 = 	"Probl�m s domobranou?";
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
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //Probl�my s domobranou?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Ti �mejdi sem po��d chod� a berou si, co cht�j.
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //Minul� t�den mi takhle sebrali v�echen �lovek. Prej �e 'je to pro dobrou v�c'.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //V�m, �e od t� doby, co sedl�ci p�estali obchodovat, se ka�dej mus� starat s�m o sebe.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //A samoz�ejm� �e n�kter� lidi maj� hlad. Je z�zrak, �e mi ty ryby nekradou p��mo pod nosem.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Ale jestli to takhle p�jde d�l, nebudu u� m�t co j�st ani j� s�m.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Dej mi v�ecky sv� ryby.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Mo�n� bych ti mohl pomoct.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Mluvil jsi o tom s paladiny?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Mluvil jsi o tom s paladiny?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //(sm�je se) D�l� si srandu? To si v�n� mysl�, �e by je zaj�maly probl�my takov�ho ubo��ka, jako jsem j�?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Dej mi v�ecky svoje ryby.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //(vztekle) J� to V�D�L! Dal�� z t�ch hajzl�!
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Ale ob�v�m se, �e jde� pozd�, tv� kamar�d��kov� u� tu byli v�era a sebrali mi �pln� v�ecko.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //No, a te� bys u� mysl�m m�l j�t.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Mo�n� bych ti mohl pomoci.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Nev�m. Snad bys mohl zn�t n�koho od domobrany, kdo m� spojen� na paladiny.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Paladini si ode m� t�ko budou kupovat ryby.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Uvid�m, co se d� d�lat.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Ryb�� Farim m� probl�m s domobranou. Cht�j� po n�m tolik ryb, �e u� mu nezb�v� nic pro vlastn� ob�ivu. Cht�lo by to naj�t n�jak�ho vlivn�ho paladina, kter� by mu pomohl."); 
		
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

	description	 = 	"V�m, jak vy�e�it ten tv�j probl�m s domobranou.";
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
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //V�m, jak vy�e�it ten tv�j probl�m s domobranou.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //A jak by to m�lo b�t?

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Nejsem tu tak �asto, abych ti ka�dou noc hl�dal ryby.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Ale zn�m n�koho, kdo to ud�lat m��e.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Paladinsk� skladn�k Martin chce, abys mu �ekl o domobran� a o tv�ch ryb�ch.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //A mysl�, �e m� pak domobrana nech� na pokoji?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Aspo� to tvrd�.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Skv�l�. D�kuju ti. Moc ti toho d�t nem��u, ale po�kej...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //Tenhle divnej modrej k�men jsem na�el na jednom z ostrov� mimo pob�e�� Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Mysl�m, �e nen� nijak zvl�� cenn�, ale ur�it� se najde n�kdo, komu se bude hodit.
		
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

	description	 = 	"M��e� mi ��ci n�co o t�ch poh�e�ovan�ch lidech?";
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
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //M��e� mi ��ct n�co o t�ch poh�e�ovan�ch lidech?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //M�j k�mo� William se za�al sch�zet s bandou divnejch individu�. A kam a� ho to dostalo?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Jednoho kr�sn�ho dne prost� nep�i�el do pr�ce a u� jsem ho v�ckr�t nevid�l.
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

	description	 = 	"Zmizel i tv�j kamar�d William?";
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
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //Tv�j kamar�d William zmizel?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //P�esn� tak. Je to ryb��, ale po��d si hraje na d�le�it�ho, na to t� mus�m upozornit.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //M�l se vod t� bandy dr�et d�l.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "Co to m��e bejt za �mejdy?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Ur�it� se brzy objev�.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Co m� za lubem?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Kdy jsi ho vid�l naposledy?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //Co m�l v pl�nu?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William m�l s t�ma dareb�kama n�jak� pokoutn� techtle mechtle.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //Mysl�m, �e se to v�ecko to�ilo kolem pa�ovan�ho zbo��, kter� t�m parchant�m prod�val.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, wei� ich nicht, was er stattdessen f�r sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //A co to bylo za parchanty?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Nem�m tucha, kdo to moh bejt, ani co d�lal tady v Khorinidu.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //V�m jenom, kde se s Williamem sch�zeli.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Jednou jsem tam Williama vid�l, kdy� jsem ryba�il v z�toce.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Kde p�esn� se sch�zeli?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Kde p�esn� je to m�sto, kde se sch�zeli?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Je to v z�toce naproti p��stavu, severn� odsud.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //D� se tam dostat jenom lod� nebo doplavat.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //Je tam pl� a malej ryb��skej t�bor. A tam jsem ho vid�l.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Ryb�� Farim oplak�v� ztr�tu sv�ho p��tele Williama, kter� se pr� �asto st�kal s n�jak�m hrdlo�ezy. Sch�zeli se v z�toce severn� od p��stavu."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "To u� mi mysl�m sta��.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Kdy jsi ho vid�l naposledy?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Jen p�ed p�r dny.

	Info_AddChoice	(DIA_Addon_Farim_William, "Nevyjel prost� na mo�e ryba�it?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Nevyjel t�eba jen na mo�e ryba�it?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //To nen� moc pravd�podobn�, jeho lo� furt kotv� v p��stavu.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //V�ak on se objev�.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //To si nemysl�m, u� je pry� moc dlouho.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Ob�v�m se, �e jednoho kr�sn�ho dne z mo�e vyt�hnu jeho mrtvolu.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Mysl�m, �e u� jsem sly�el dost.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Ani se nenam�hej, stejn� nev���m, �e ho najde�.
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

	description	 = 	"Tak co, berou, berou?";
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
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //Tak co, berou, berou?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //P�esta� p�edst�rat, �e t� to zaj�m�.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //U� jsem za�il lep�� �asy. Jen m�lokdo p�e�il a spousta lid� um�ela.
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
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Tak u� jsi tu zas?
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //Doslechl ses n�co o m�m k�mo�i Williamovi?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Je mrtv�.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //(povzdychne si) Jo, p�esn� to jsem �ekal.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //D�ky, �e ses vr�til, abys mi to �ek.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //P�jdu do hospody a propiju jeho pod�l z na�eho posledn�ho �lovku � p�esn� tak by si to p��l.
};







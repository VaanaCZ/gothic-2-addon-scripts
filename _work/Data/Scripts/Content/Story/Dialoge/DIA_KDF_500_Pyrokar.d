///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Tak ty jsi ten nov� novic. Dobr�, p�edpokl�d�m, �e u� t� s tv�mi povinnostmi obezn�mil otec Parlan.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(lehce k�rav�) V�, �e ka�d� �len Spole�enstva ohn� by m�l sv� povinnosti plnit v souladu s Innosovou v�l�.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "Mus�m mluvit s paladiny. Dost to sp�ch�.";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Mus�m mluvit s paladiny. Dost to sp�ch�.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //A �ekne� n�m, pro� s nimi chce� mluvit?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //M�m pro n� d�le�itou zpr�vu.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //Co by to jako m�lo b�t za zpr�vu?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //V Hornick�m �dol� se shroma��uje arm�da zla veden� draky! Mus�me je zastavit, dokud m��eme.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Hm. Budeme o tv�ch slovech p�em��let, novici. A� nadejde �as, d�me ti v�d�t, jak rada rozhodla.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Mezit�m by sis m�l l�pe hled�t povinnost� novice.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Dobr�, u� t� nebudeme d�le zdr�ovat od tv� pr�ce - m��e� j�t.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "Hled�m Innosovo oko.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Hled�m Innosovo oko.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Ka�d�, kdo si mysl�, �e by mohl svat� amulet nejen naj�t, ale dokonce ho i pou��vat, je hlup�k.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //Amulet si s�m vyb�r� sv�ho majitele - nikdo, krom� toho, komu je to p�edur�eno, ho nen� schopen nosit.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Jsem ochotn� to zkusit.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Povinnosti novice t� maj� nau�it poko�e - ne ��dostivosti.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Nemysl�m, �e by to bylo tak t�k�, ale Pyrokar mi Oko dobrovoln� a bez pomoci paladin� nevyd�.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Dobr�, u� t� nebudeme d�le zdr�ovat od tv� pr�ce - m��e� j�t.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"N�kte�� khorinid�t� ob�an� z�hadn� zmizeli.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //P�r khorinidsk�ch obyvatel nevysv�tliteln� zmizelo.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //To je mi zn�mo a je to velmi politov�n�hodn�. Ale dohodli jsme se s m�gy vody, �e se v t�to z�le�itosti nebudeme nijak anga�ovat.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //To sam� plat� o vy�et�ov�n� t�ch podivn�ch zem�t�esen� v severov�chodn�ch oblastech Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Zat�m jsme nedostali ��dnou zpr�vu, �e by pot�ebovali na�i pomoc, tak�e v t�hle v�ci nesm�me podniknout nic.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Ano, ale...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //��dn� ale! Budeme postupovat, jak se slu��, a douf�m, �e se podle toho bude� chovat i TY.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Ohniv� m�gov� sice ztracen�ch ob�an� lituj�, ale tvrd�, �e tyto v�ci maj� na starosti m�gov� vody. V kl�te�e mi v t�to v�ci nijak nepomohou."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(rozzloben�) Poslu�nost pat�� mezi ctnosti, kter�ch se m� je�t� co u�it. A� tak, �i tak.
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"Cht�l bych podstoupit zkou�ku ohn�.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Cht�l bych podstoupit zkou�ku ohn�.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(p�ekvapen�) Tak ty o tom v�... ty chce� podstoupit zkou�ku ohn�?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Ano, pro�etl jsem si Pr�vo ohn�, kde se ��k�...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(p��k�e p�eru��) My zn�me Pr�vo ohn�. Taky jsme ale vid�li mnoho novic� b�hem toho testu zem��t. M�l bys sv� rozhodnut� je�t� zv�it.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //To jsem u� ud�lal. Chci tu zkou�ku - a jsem p�ipraven j� proj�t.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(varovn�) Kdy� na tom bezpodm�ne�n� trv�, tak t� Rada k t� zkou�ce p�izve.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Trv�m na tom, abych byl p�izv�n ke zkou�ce ohn�.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //V tom p��pad� - a� je po tv�m. A� bude� p�ipraven, dostane� od ka�d�ho �lena Rady �kol, jej� mus� splnit.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Nech� se Innos slituje nad tvou du��.
	
	B_LogEntry (TOPIC_FireContest,"Po��dal jsem Pyrokara o zkou�ku ohn�. Nyn� mus�m splnit t�i �koly, kter� mi zad� nejvy��� rada.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //A jedin� Innos s�m v�, jestli j� projde�. Podstupuje� stejnou zkou�ku, jak� je ur�ena vyvolen�m novic�m.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Zkou�ka magie. (odm��en�) Asi v�, �e zkou�kou m��e proj�t pouze jeden jedin� novic.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //To v�m. Tak kdo jsou moji soupe�i?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Innos ve sv� moudrosti vybral t�i novice, kte�� se tak� chystaj� proj�t testem: Agon, Igaraz a Ulf. U� za�ali s hled�n�m.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(�se�n�) Ale dost u� o tom! Sly� slova t�to zkou�ky: 'N�sleduj Innosova znamen� a dones n�m, co v���c� nalezl na konci cesty.'
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Bude� pot�ebovat tenhle kl��.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //To je v�e, co ti k tomu �ekneme.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar pro m� p�ipravuje zkou�ku magie - stejnou jako je ta, kterou podstoup� zvolen� novicov� Ulf, Igaraz a Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Mus�m n�sledovat Innosova znamen� a p�in�st to, co v���c� najde na sv� cest�. Dostal jsem k tomu i kl��.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Dokud bude� pracovat na zkou�ce, nesm�me ti nic ��ct.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Co tady je�t� post�v�? B� se vypo��dat se svou zkou�kou!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Nade�el �as porovnat tv� velk� slova s tv�mi skutky. Nemysl�, novici?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Na�el jsem ten runov� k�men.";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //Na�el jsem ten runov� k�men.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(nev���cn�) Ty... dok�zal jsi to?! Sledoval jsi znamen� a objevil ukryt� port�l...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //...a taky jsem porazil v�echna ta stvo�en�, co m� pova�ovala za p��jemnou sva�inku.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //A co ostatn� novicov�? Co Agon? Neusp�l d��v ne� ty?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Neobst�li. P�edpokl�d�m, �e jim zkou�ka nebyla p�edur�ena.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Dobr�, tak�e vyhl�s�me, �e jsi pro�el zkou�kou. A ten runov� k�men si m��e� ponechat.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Pr�fung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Pro�el jsi zkou�kou, kterou jsem ti p�ichystal.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Ale...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //...ale je�t� mus� splnit Uthlar�v �kol.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //...je�t� mus� dokon�it Serpent�v test.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"A budu te� p�ijat do spole�enstva m�g�?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //A budu te� p�ijat do spole�enstva m�g�?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Dok�zal jsi to. Pro�el jsi zkou�kou ohn�. Celou dobu jsme si tv�m �sp�chem byli jist�.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(ne�stupn�) Tak jako je jist�, �e ze sebe vyd� to nejlep��, aby ses mohl st�t ctihodn�m slu�ebn�kem Innose.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Tak�e pokud jsi p�ipraven slo�it P��sahu ohn�, p�ijmeme t� mezi sebe jako m�ga.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"Jsem p�ipraven vstoupit do kruhu ohn�.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Jsem p�ipraven vstoupit do kruhu ohn�.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Dobr�, tak slo� posv�tnou P��sahu ohn�.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(v�n�) P��sah� p�ed Innosem, kter� je na��m V�emohouc�m, jeho slu�ebn�ky a Svat�m plamenem...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //...�e od nyn�j�ka nav�dy bude cel� tv�j �ivot zasv�cen ohni...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //...dokud tv� t�lo a tv� du�e nenalezne odpo�inku v jeho svat�ch komnat�ch a plamen tv�ho �ivota nevyhasne?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //P��sah�m.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Vy��en�m slov p��sahy jsi vstoupil do svazku s ohn�m.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Nos tuto r�bu jako symbol v��n�ho pouta.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//f�rs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Te�, kdy� jsme t� p�ijali mezi n�s, si m��e� promluvit s lordem Hagenem, nejvy���m velitelem paladin�.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Rovn� bychom velmi r�di v�d�li, jak on hodnot� situaci. Tak�e je ti dovoleno odej�t do Khorinidu.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //O�ek�v�me, �e n�m odpov�� donese� neprodlen�.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Co se mohu nau�it te�?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Co v�echno se te� m��u nau�it?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Hlavn� m� te� pr�vo dozv�d�t se v�e, co se t�k� magick�ch kruh�. Daj� ti moc, kterou bude� pot�ebovat k pou��v�n� magick�ch run.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //��m vy���ho magick�ho kruhu dos�hne�, t�m siln�j�� kouzla bude� moci pou��vat.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Od bratr� v kl�te�e se m��e� nau�it magick�m formul�m. Ka�d� z nich se zam��uje na ur�itou oblast, o kter� t� m��e hodn� nau�it.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Nap��klad Karras je mistrem vz�v�n� a vyvol�v�n�. Hyglas t� zase zasv�t� do ohniv� magie.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Nikdo toho o s�le mrazu nev� v�c ne� Marduk. Parlan t� m��e nau�it v�echna ostatn� zakl�nadla - a zasv�t� t� do prvn�ch kruh�.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Ale mohou t� nau�it jen magick�m formul�m - runy si bude� muset vyrobit s�m.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Mistr Parlan m� uvede do prvn�ch magick�ch kruh�.");
	
	B_LogEntry (Topic_KlosterTeacher,"Bratr Karras vyu�uje formule pro invoka�n� a vyvol�vac� kouzla.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Hyglas mi p�ibl�� tajemstv� ohn�.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Marduk m� sezn�m� s moc� ledu a bou��.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Parlan vyu�uje r�zn� dal�� formule.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Cht�l bych vyslovit sv� p��n�.";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Cht�l bych vyslovit jedno p��n�.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Pot�, co je ka�d� m�g p�ijat do Spole�enstva, m� pr�vo prvn�ho skutku.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Tak co ud�l� jako prvn� v�c v roli m�ga?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Nic.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Nech� se nov�m kl�tern�m zahradn�kem stane Babo.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"A� m� novic Opolos p��stup do knihovny.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Kdyby tak Dyrian z�stal i nad�le v kl�te�e.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Nic.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(u�asle) Tak tedy budi�. Nov� m�g se vzdal sv�ho �inu.
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //A� novic Dyrian z�stane v kl�te�e.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Jak si p�eje�.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Novicovi bude dovoleno z�stat v kl�te�e a bude zast�vat funkci zahradn�ka, kter� je pr�v� k dispozici.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //A� se novic Babo star� o kl�tern� zahradu.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Jak si p�eje�.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //Novicovi Babovi se s okam�itou platnost� sv��uje do p��e kl�tern� zahrada.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //A� m� novic Opolos p��stup do knihovny.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Jak si p�eje�.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //Odte� m��e novic Opolos studovat Innosovo p�smo.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"P�in��m zpr�vy od lorda Hagena...";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //M�m zpr�vy od lorda Hagena. Po�aduje d�kazy o p��tomnosti drak� a arm�dy zla.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Tak�e vyraz�m do Hornick�ho �dol� a p�inesu jim ten d�kaz.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Dobr�. Tak tedy spl� tento �kol. Paladin Sergio t� doprovod� do pr�smyku.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Nech� t� Innos ochra�uje.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Tak�e vyraz�m p��mo do Hornick�ho �dol�.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Dobr�. Jeliko� cestu do Hornick�ho �dol� u� zn�, nebude� pot�ebovat ��dn� doprovod.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Postarej se o tu z�le�itost pro lorda Hagena - nech� t� Innos prov�z�.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Nau� m� posledn� magick� kruh.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Nau� m� posledn� magick� kruh.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Uplynulo mnoho �asu od chv�le, co jsi vstoupil do svazku s ohn�m. P�ihodilo se mnoh� a na odpo�inek nikdy nebylo p��li� �asu.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Jsi Innosov�m vyvolen�m. Proto bude� pot�ebovat v�echnu svou s�lu, abys obst�l ve v�ech nadch�zej�c�ch bitv�ch.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Te� se ode m� do�k� zasv�cen�, vyvolen�. Vstupuje� do �est�ho kruhu - �i� sv�tlo a rozptyluj temnotu.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Nyn� se ode m� m��e� nau�it magick� formule posledn�ho kruhu. Pokud po tom tedy tou��.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Ach. A je�t� jedna v�c - chv�li mi trvalo, ne� jsem t� poznal.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //M�l jsi u sebe ten dopis, co ti dali, kdy� t� uvrhli za bari�ru.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Ano, u�et�il jsi mi tak spoustu t�ch soudn�ch �e��.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //A ty jsi Innosov�m vyvolen�m.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //P�ijmi te� ode m� po�ehn�n�, � vyvolen�!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innosi, sv�tlo slunce a ohni sv�ta, po�ehnej tomuto mu�i, tv�mu vyvolen�mu slu�ebn�kovi.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Dej mu odvahu, s�lu a moudrost, aby mohl p�ijmout cestu, kterou jsi mu zvolil.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //�as je�t� nenade�el. Jakmile po cest�, kterou ti Innos ukazuje, dojde� trochu d�l, pak t� za�nu u�it.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Instruuj m� (vytvo�en� run)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Nau� m� n��emu.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Nen� nic dal��ho, �emu bych t� mohl je�t� nau�it.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pos�l� m� Parlan.";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Pos�l� m� Parlan. Cht�l bych pos�lit svoji magickou moc.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Dobr�, u� ses dost nau�il a zna�n� jsi zes�lil. Odte� se bude� u�it ode m�.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Cht�l bych pos�lit svoji magickou moc.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Cht�l bych pos�lit svoji magickou moc.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //C�t�m, �e tebou magick� moc proch�z� v pln� s�le. Dokonce u� nejsem schopen ti uk�zat, jak bys ji mohl je�t� v�ce pos�lit.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(Po�ehn�n�)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Po�ehnej mi, Pane.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Co takhle mal� po�ehn�n�? Opravdu by se mi hodilo.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Nech� je tv� posledn� bitva proti na�emu arcinep��teli korunov�na �sp�chem. Innos bu� s tebou.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Nech� je Innos s tebou a za�ehn� v�echny pekeln� cesty, kter� se ti otev�ou.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"P�ich�z�m z Hornick�ho �dol�.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //P�ich�z�m z Hornick�ho �dol�.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Co p�in�� za zpr�vy?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //Nep��tel se spojil se sk�et� arm�dou a s draky.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //To u� jsme se dozv�d�li od Miltena - ale co kr�lovsk� n�klad rudy?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Doly, ve kter�ch se t�ilo pro Garonda, nemohou uspokojit kr�lovy po�adavky.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Dny jsou st�le zast�en�j�� a slune�n� sv�tlo sl�bne.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Byl jsem napaden mu�i v �ern�ch k�p�ch.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //J� v�m. To jsou P�tra�i. Nohsledi z Beliarovy podsv�tn� ��e. Sna�� se nad tebou z�skat moc.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Jakmile se t� zmocn�, u� to nebude� ty. Jedin� tady v kl�te�e ti pak bude pomoci. Tak�e bu� opatrn�.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar mi vypr�v�l o p�tra��ch, mu��ch v �ern�ch h�bitech, kte�� jsou Beliarov�mi nohsledy. Varoval m�, �e dok�� ovl�dat a posednout druh�. M�m se vr�tit p��mo do kl�tera, kdyby se mi to n�hodou stalo tak�."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Po��dal jsem Karrase, aby se na tu z�le�itost pod�val. Ur�it� brzy dojde k n��emu, co n�m dopom��e k lep��mu pochopen� toho v�eho.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar nak�zal Karrasovi, aby se vypo��dal s hrozbou p�tra��."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Tady - pokud bude� pot�ebovat na�i pomoc, p�enese t� tahle runa p��mo do kl�tera.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Pamatuj, mus�me z�stat ostra�it�, nebo budeme odsouzeni k z�hub�.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"P�i�el jsem si pro Innosovo oko.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //P�i�el jsem si pro Innosovo oko.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Vid�m, �e t� lord Hagen pov��il �d�lem n�st Innosovo oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Boj�m se, �e t� mus�m zklamat. Stali jsme se ob�t� zr�dn�ho spiknut� nep��tele.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Innosovo oko bylo n�siln� odebr�no z t�chto svat�ch zd�.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Kdo se opov�il, pane?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Kdo to byl?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Kdo se opov�il, pane?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Kdo to byl?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Zlo je vychytral� a v�dycky pracuje v utajen�. Jen velmi vz�cn� se ti poda�� odhalit jeho intriky na denn�m sv�tle.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Ale v t�chto dnech je to jin� v�c. Nep��tel se ukazuje zcela otev�en� na ulic�ch, v ka�d�m dom� a na ka�d�m n�m�st�.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //To m��e znamenat jen to, �e u� se neboj� ��dn�ho nep��tele a nezastav� se p�ed ni��m.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Jeden z na�ich v�rn�ch n�sledovn�k�, kandid�t na nositele r�by vyvolen�ch m�g� ohn�, ne�ekan� zm�nil p�edm�t sv� v�rnosti a propadl oby�ej�m zla. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //Nep��tel se zmocnil jeho mysli a p�ivedl n�s tak ke stra�n� proh�e.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro se probil na�imi nejsvat�j��mi komnatami a ukradl Oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Boj�m se, �e tr�vil p��li� mnoho �asu o samot� mimo kl�ter, a tedy mimo dosah jeho ochrann�ch zd�. Vystavoval se tak mnoh�mu nebezpe��.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschu� freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist f�r den SC nun als Traitor bekannt. Mu� hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "No to jsem si mohl myslet. Trochu jsem se opozdil a ti zabedn�nci z kl�tera zat�m dopustili, aby jim n�jak� novic p��mo p�ed nosem vyfoukl Innosovo oko. Te� mi nezb�v� nic jin�ho, ne� j�t po tom zr�dci Pedrovi a doufat, �e je je�t� nikomu neprodal.");
 	B_LogEntry (TOPIC_TraitorPedro, "Innosovo oko ukradl z kl�tera zr�dce Pedro. M�m pocit, �e ohniv� m�gov� by ho a� moc r�di dostali do rukou.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"M�te tu�en�, kam ten zlod�j utekl?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //M�te tu�en�, kam ten zlod�j utekl?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro zne�kodnil n�kolik dal��ch novic�, kte�� se ho pokou�eli zastavit, a zmizel v rann� mlze.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //U� se za n�m vydalo mnoho novic�, aby mohli Oko vr�tit v po��dku na sv� m�sto.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Pokud ho chce� dopadnout, mus� si posp�it, dokud Pedro nezmiz� z tv�ho dosahu.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"Na�el jsem Innosovo oko.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //Nalezl jsem Innosovo oko. Je rozbit�.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Ale... to nen� mo�n�. Co se stalo?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Padlo do rukou t�ch odporn�ch zr�d. Stejn� jsem u� p�i�el pozd�.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //P�ipravovali tam naho�e v les�ch podivn� zakl�nadlo pro n�jak� m�s��n� ritu�l.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Innos s n�mi. Znesv�tili n� kruh Slunce.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Ani ve sv�ch nejhor��ch no�n�ch m�r�ch jsem si nikdy nep�edstavoval, �e si osvoj� takovou moc.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Co budeme d�lat te�?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Co budeme d�lat te�?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //Nep��tel se stal velmi siln�m. Je�t� st�le v�ak pro n�j tenhle artefakt p�edstavuje mocnou hrozbu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Mus�me Innosovo oko opravit a navr�tit mu jeho starou s�lu. Ale �as je proti n�m.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Nedok�u si p�edstavit, co se s n�mi v�emi stane. Bez ochrany Oka jsme nep��teli vyd�ni na milost.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Zajdi do m�sta za Vatrasem, vodn�m m�gem. Za t�chto stra�n�ch okolnost� si bude v�d�t rady jedin� on. Vezmi Oko k n�mu a posp� si.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Pro� Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Pro� kruh Slunce?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar chce, abych ve m�st� poprosil o radu m�gy vody a ot�zal se jich, co d�lat s po�kozen�m Okem.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Pro� pr�v� za Vatrasem?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Privilegium nosit r�bu t� je�t� neoprav�uje k tomu, aby ses vypt�val na d�vody m�ch instrukc�, brat�e.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras je Adan�v slu�ebn�k. V�domosti toho vodn�ho m�ga n�m vnesou trochu sv�tla do tohoto temn�ho �asu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //To je v�e, co pot�ebuje� v�d�t.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Pro� kruh Slunce?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Ka�doro�n� se v �ase slunovratu v�ichni m�gov� a novicov� kl�tera vyd�vaj� na cestu na toto m�sto, aby zde p�iv�tali po��tek nov�ho cyklu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //To m�sto zapl�uje nesm�rn� moc Slunce.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Nikdy jsem ani nepomyslel na to, �e by tato moc mohla b�t zvr�cena. A te� se pr�v� tohle stalo.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"Mluvil jsem s Vatrasem.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //Mluvil jsem s Vatrasem.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //V�born�. Kde je?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //P�ipravuje ve slune�n�m kruhu ritu�l pot�ebn� k oprav� Innosova oka.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Pokud je to pravda, tak n�m je�t� mo�n� z�stala jisk�i�ka nad�je.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras chce, abyste mu s t�m ty a Xardas pomohli.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //CO? Xardas tam bude taky? To nem��e� myslet v�n�.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Hele. J� o tom nerozhodl. Po�aduje to Vatras.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Po��d ten Xardas. U� m� za��n� unavovat. Jen t�ko to mohlo dopadnout h��.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Jak m�m v�d�t, �e Xardas nen� ve spolku s nep��telem?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Nem��u Xardasovi v��it a je jedno, jak moc ho pot�ebujeme.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Je mi l�to, ale za t�chto okolnost� nemohu Vatrasovi pomoci.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"Ale bez tebe to nep�jde...";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Bez tebe to nep�jde. Vatras nen� schopen ten ritu�l jinak p�ipravit.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Bude� muset Xardasovi v��it.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Nem��u nic d�lat, sly��? Nem�m ani nejmen�� d�kaz toho, �e Xardas nepracuje proti n�m. Nem��u to ud�lat.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //A co kdy� ti n�jak� d�kaz se�enu?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Boj�m se, �e to je nemo�n�. To by m� opravdu p�ekvapilo.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //A m�m zna�n� pochybnosti o tom, �e by m� Xardas je�t� mohl n���m p�ekvapit. I p�i jeho nevypo�itatelnosti.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar m� z Xardase po��dn� strach. Mus�m s Xardasem prodiskutovat, jak ho p�im�t k ��asti na ritu�lu kruhu Slunce.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"P�inesl jsem od Xardase tuhle knihu.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //P�inesl jsem od Xardase tuhle knihu.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //Je to symbol jeho d�v�ryhodnosti.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Uka� mi to.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(vzru�en�) Ale to je neuv��iteln�. M� ty v�bec pon�t�, co je to, cos mi pr�v� dal?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Ehm. Ne.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(podr�d�n�) Tohle je starobyl�, velmi dlouho ztracen� kniha z �as� d�vno minul�ch.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //M�li jsme za to, �e je ztracena jednou prov�dy, ale te� vid�m, �e Xardas celou tu dobu v�d�l, co se s n� stalo.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Tak�e souhlas� s t�m ritu�lem?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Ano, m�l bych vyrazit ke slune�n�mu kruhu, ale rozhodn� ne proto, �e bych byl p�esv�d�en� o Xardasov�ch dobr�ch �myslech.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //Vlastn� se chyst�m z toho psa dostat vysv�tlen�, kde tolik let ukr�val tu knihu. Tentokr�t za�el p��li� daleko.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Uvid�me se u slune�n�ho kruhu.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar kone�n� souhlasil, �e nav�t�v� kruh slunce.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mysl�, �e to Oko dok�ete spravit?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Mysl�, �e to Oko dok�ete spravit?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //T�ko ��ct. Po�k�me a uvid�me.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"Dok�zali jste to. Innosovo oko je zase v po��dku.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Dok�zali jste to. Innosovo oko je zase v po��dku.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Jen st�� m��u uv��it, �e je n�co takov�ho mo�n�.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Ano, mist�e.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //U� jsi mnohokr�t prok�zal, �e jsi hoden Vy���ho ��du ohniv�ch m�g�.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Od tohoto dne jsi �lenem Rady a bude� n�s ��d reprezentovat po cel�m sv�t�. Te� jsi jedn�m z vy���ch ohniv�ch m�g�.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //U��vej r�bu vyvolen�ch s d�stojnost� a p�ines ��du sl�vu a bohatstv�, m�j brat�e.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"Co je tady je�t� zapot�eb� ud�lat?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Co tu je�t� mus�m u�init?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Nepl�tvej sv�m �asem na malichernosti. B� porazit draky. Tady, vezmi si Oko.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Nezapome�, �e mus� s drakem nejprve promluvit, ne� ho napadne�.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es f�gt ihnen auch unertr�gliche Schmerzen zu, wenn du es bei dir tr�gst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Moc Oka p�inut� draka promluvit a ��kat pravdu.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Tak� ti, pokud ho m� na sob�, poskytuje ochranu proti jejich �tok�m.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Nicm�n�, moc Oka nen� nevy�erpateln�. Bude� ho muset dopl�ovat magickou energi�.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Bude� k tomu pot�ebovat esenci z dra��ho srdce, kterou m��e� s Okem spojit v alchymistick� kolon�.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Jedin� pak se m��e� odv�it postavit drakovi.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //D�ky. Budu si to pamatovat.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Te� m� v�e, co pot�ebuje�. Tak jdi. U� ti nezb�v� mnoho �asu.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Te� u� mohu bez obav �elit drak�m - sta�� si p�i boji nasadit Innosovo oko a mohu je v�echny postupn� zni�it. P�ed bojem si ale mus�m s drakem v�dycky promluvit, jinak nem�m �anci. Probl�m je, �e ka�d� takov� rozhovor p�ipravuje Oko o ��st moci. Obnovit ji mohu pouze v alchymistick� kolon� s pomoc� dra��ho srdce a pr�zdn� laboratorn� ba�ky, kde s pomoc� extraktu z dra��ho srdce mohu moc artefaktu znovu probudit. Teprve pak se mohu postavit dal��mu obludn�mu je�t�rovi."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"Nalezl jsem podivn� almanach.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //Nalezl jsem podivn� almanach.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Opravdu? Co je to za almanach?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Nejsem si jist�. M�l jsem dojem, �e ty bude� v�d�t, k �emu to je.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //V�ru, to je velmi znepokojiv�. Jsem r�d, �es mi to p�inesl. To od tebe bylo opravdu moudr�.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //P�edpokl�d�m, �e tam toho bude v�c. B� a najdi v�ce t�chto knih zatracen�.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Vypad� to, �e je to n�stroj moci P�tra��.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Pou��vaj� jej k ovl�d�n� ztracen�ch du�� sv�ch ob�t�.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Obvykle si do t�ch knih zapisuj� jm�na t�ch, kter�ch se cht�j� zmocnit.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Poslouchej. D�m ti tenhle magick� svitek. Uk�e ti jm�na, kter� jsou zanesen� do t�ch knih.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Najdi ty ob�ti a p�ines mi jejich knihy. M�l bych je sprovodit ze sv�ta.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Ale nejprve bys m�l alespo� jednu z nich uk�zat Karrasovi. Mo�n� se mu bude p�i jeho studi�ch k n��emu hodit.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Neud�lej hloupost a nepokou�ej se je ni�it s�m. Je�t� nejsi schopen odolat jejich moci.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar chce zlomit moc Almanachu posedl�ch. Dal mi proto seznam v�ech, kter� p�tra�i hodlaj� ovl�dnout - postupem �asu se m��e rozr�stat o dal�� jm�na."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Nep�ibli�uj se k P�tra��m, jinak t� proklej�.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Pokud nebude� schopen odol�vat jejich vol�n�, vra� se ke mn�, jak nejrychleji to bude mo�n�.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Pouze tady v kl�te�e je tv� du�e v bezpe��.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //Neexistuje proti t�m ment�ln�m �tok�m n�jak� ochrana?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Mo�n� to je. Karras by o tom mohl n�co v�d�t.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"S Karrasovou pomoc� pr� mohu naj�t ochranu p�ed ment�ln�mi �toky p�tra��."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Vyl��it posedlost)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Vyle� m�, pane, byl jsem proklet.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //Budi�! Vezmi si tenhle lektvar. To t� zbav� tv�ch no�n�ch m�r.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Nech� je ti Innosova sp�sa ochranou.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Jednej v jeho jm�nu a st�ez se zl�ho nep��telova pohledu.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Ale abych t� varoval - pokud bude� jejich vlivu vystaven p��li� �asto, u� pro tebe za jist�ch okolnost� nebude n�vratu. V�dycky na to pamatuj.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //M�m dojem, �e jsem byl proklet. M��e� m� vyl��it?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Ne bez d�kazu tv�ho respektu k tomuto kl�teru, m�j synu. 300 zlat�ch.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "To je p��li�.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "V�born�. Tady jsou pen�ze.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Ale v�dy� ty je�t� jeden l��iv� lektvar m�. Vra� se, a� bude� mou pomoc opravdu pot�ebovat.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //V�born�. Tady jsou pen�ze.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Tady, vypij tohle. Nech� je ti Innosova sp�sa ochranou.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //P�ines mi ty pen�ze a dostane se ti pomoci.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //To je p��li�.
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"M��u ti o tom proklet� ��ct i n�co v�c.";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //M��u ti o tom proklet� ��ct i n�co v�c.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Mluv, brat�e.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold f�r einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //Nalezl jsem dal�� almanach.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //M�m pro tebe t�ch Sp��ov�ch knih je�t� v�c.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Dobr�. Nicm�n� se ob�v�m, �e je jich k nalezen� mnohem v�c. Pokra�uj v hled�n�.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Nalezli jsme jich u� mnoho. Nemysl�m si v�ak, �e to jsou �pln� v�echny.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //U� jsi mi p�inesl spoustu t�ch nep��telsk�ch knih.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Docela by m� p�ekvapilo, kdyby mezi sebou m�li je�t� n�jakou.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Vezmi si tohle. Je to d�rek od kl�tera, kter� ti pom��e poka�d�, kdy� se st�etne� se zlem.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //A nezapome� se jednou za �as pod�vat do m�ho magick�ho svitku.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Je docela dob�e mo�n�, �e se pokus� to sam� prov�st i n�komu jin�mu, jeho� jm�no jsme v t�ch knih�ch nena�li.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"V�ichni draci u� jsou mrtv�.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //V�ichni draci jsou mrtv�.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //To je bezesporu dobr� zpr�va. Ale na situaci to nic nem�n�. Vypad� to dost beznad�jn�.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //P�tra�i je�t� po��d nezmizeli. Pr�v� naopak. Sly�el jsem mnoho zv�st� o tom, �e se posledn�ch p�r dn� jejich po�et je�t� zv��il.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Vybit� drak� m�lo nep��tele zne�kodnit, ale asi to nesta�ilo. Mus�me to zlo vyrvat i s ko�eny.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"Mluvil jsem s draky.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //Mluvil jsem s draky.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //Co ��kali?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Pov�dali o moci jejich P�na a o tom, �e se usadil Irdorathsk�ch s�n�ch.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Innos s n�mi. Temn� chr�m znovu nabyl sv� s�ly a te� vys�l� sv� p�isluhova�e do na�eho sv�ta.

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"Co jsou to ty Irdorathsk� s�n�?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Co jsou to ty Irdorathsk� s�n�?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //V�chodn� chr�m vz�v�n� boha Beliara. V zemi Myrtana jsou celkem �ty�i. Ale tenhle je pravd�podobn� nejd�siv�j�� ze v�ech.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Asi p�ed 40 lety byly zni�eny chr�my tohoto stra�n�ho bo�stva na z�pad� a na severu.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //State�n� ryt��i t�ch �as� srovnali ty mocn� stavby se zem�.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //Pak se �ern� hordy nep��tel staly proti p�evaze hrdinsk� odvahy ryt��� a paladin� bezmocn�mi.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Nem�lo by b�t p��li� t�k� zni�it i ty zbyl� dva chr�my a o�istit tak nav�dy zemi od zla.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //...ale pot�, co druh� chr�m padl, prost� zmizely.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(posm�n�) Zmizely. Cel� chr�my. Jo, jasn�.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Nesm�j se. Situace je v�n�. Pokud Irdorathsk� s�n� znovu nabyly sv� moci, pak nebude nijak snadn� nep��tele porazit.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Proto ho bude� muset naj�t a pova�ovat to za sv�j dal�� a je�t� t잚� �kol.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Uvid�me.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Podle Pyrokara jsou Irdorathsk� s�n� ztracen�m chr�mem, kde uct�va�i vz�vali boha Beliara. Mus�m jej naj�t."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"Xardasova kniha, kter� byla pova�ov�na za ztracenou - kde je?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Xardasova kniha, kter� byla pova�ov�na za ztracenou - kde je?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //�ekal jsem, �e se na to zept�. Ale ob�v�m se, �e ti to k ni�emu nebude.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Byla magicky zape�et�na. Ukryl jsem ji do jedn� z na�ich podzemn�ch skr���. Dokonce jsme se u� pokou�eli ji otev��t. Marn�.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Ten zpropaden� Xardas s n�mi hraje �pinavou hru.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //M��u se na tu knihu pod�vat?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Jak je libo. Nedok�u si p�edstavit, �e bys usp�l, kdy� se to nepovedlo nejv�t��m mistr�m kl�tera.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Ale klidn� b� a zkus to, Talamon ti nebude br�nit.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardasova kniha Irdorathsk� s�n� je ukryta ve sklepen�ch kl�tera, kde ji st�e�� Talamon. M�gov� ji ale nedok�� otev��t - jej� magickou pe�e� pr� m� na sv�dom� s�m Xardas."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"Poda�ilo se mi otev��t Xardasovu knihu.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //Poda�ilo se mi otev��t Xardasovu knihu.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Co? Jak jsi to dok�zal? M�lem m� to p�ivedlo k zoufalstv�.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas mi to prozradil.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "�ekl bych, �e �t�st� si prost� jednou sedne i na vola, nic jin�ho.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //�ekl bych, �e �t�st� si prost� jednou sedne i na vola, nic jin�ho.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Nevykl�dej nesmysly. �t�st�!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Mn� se to v�bec neda�ilo a pak je to pro n�koho jako ty �pln� hra�ka...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //...proto m�m o �em p�em��let.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Jinak. Jeliko� jsi byl jedin�m, kdo to dok�zal otev��t, asi bude nejlep��, kdy� ti bude sv��ena do p��e. Alespo� do t� doby, ne� p�ekon�me tuhle krizi.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas mi to prozradil.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //�, tak je to. Jak zaj�mav�. Jen ve tv�m vlastn�m z�jmu douf�m, �e t� Xardas�v �patn� vliv je�t� nezkazil.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Varuju t�. Nepodlehni �skok�m toho star�ho zla. Mohl bys toho pozd�ji litovat.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"V t� knize je zm�nka o tajn� knihovn�.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //V t� knize je zm�nka o tajn� knihovn�.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //O �em to mluv�?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //O knihovn� tady za tou zd�. Trefil jsem se?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Ne. Kde jsi ��kal, �e by ta knihovna m�la b�t?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Rozum�m. Nem� tu�en�. Mmh.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar o tajn� knihovn� nic nev� - pravd�podobn� do n� m�l p��stup pouze Xardas."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"V�m, kde hledat Irdorathsk� s�n�.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //V�m, kde hledat Irdorathsk� s�n�.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Ten chr�m je na ostrov�. Nalezl jsem n�mo�n� mapu, na kter� je zachycena cesta.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //To je skv�l�. Tak to bude� pot�ebovat lo� a pos�dku, aby ses mohl postavit nep��teli.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Ale nezapome�, �e se mus� dob�e p�ipravit, abys byl schopen porazit p�na Irdorathu.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Kde najdu n�jakou pos�dku?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Tvoje pos�dka by m�la sest�vat z mu��, kter�m se d� v��it.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Promluv si se sv�mi p��teli a pop�em��lej, kdo by se ti mohl hodit, a� bude� na ostrov�.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Taky bude� pot�ebovat m�ga. Ale bohu�el, j� nem��u nikoho z kl�tera postr�dat.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Bude� se muset zeptat n�jak�ho m�ga, co ne�ije v kl�te�e.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"Jorgen je zku�en� n�mo�n�k.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen je zku�en�m n�mo�n�kem. Mohl by mi pomoci dostat se na ostrov Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Ob�v�m se, �e to nebude tak snadn�.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Upsal se pr�ci pro bratrstvo. Neslo�il n�m ani poplatek, ani n�m nep�ivedl ovci.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen mus� nejprve dokon�it svou pr�ci a pak si ho m��e� odv�st, pokud bude� m�t z�jem.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Jak dlouho to bude trvat?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Spot�eboval tolik z�sob, kolik by novicovi sta�ilo p�inejmen��m na t�i t�dny. A to za jeden den.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Tak�e ho nem��u nechat j�t d��v, ne� si v na�� zahrad� tvrd� odpracuje t�i m�s�ce.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"Co mus�m ud�lat, abych si mohl Jorgena odv�st hned te�?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //Co mus�m ud�lat, abych si mohl Jorgena odv�st hned te�?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Mmh. Samoz�ejm�, je tu jedna v�c, kterou bys mohl ud�lat. Mohly by ti s t�m pomoci tv� dobr� vztahy s Xardasem.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //V�iml jsem si, �e se posledn�ch p�r dn� d�j� na jeho v�i divn� v�ci.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Mnoho lid� ��k�, �e odtamtud v noci vych�zej� r�zn� sk�eky a �e nad jeho v�� tancuj� divn� sv�tla.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Jako bychom nem�li dost sv�ch vlastn�ch starost�. B� zjistit, co se tam d�je, a za�i�, a� to p�estane.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Pak dostane� Jorgena.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"V Xardasov� v�i se d�j� divn� v�ci. Pokud se o n� postar�m, mohu vz�t Jorgena s sebou.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"Pova�uj tu v�c s Xardasovou v�� za vy��zenou.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Pova�uj tu v�c s Xardasovou v�� za vy��zenou.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Tak co se tam d�lo... ne, po�kej, rad�i to nechci v�d�t.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Jestli po��d chce� Jorgena, tak b� a vezmi ho s sebou na tu svou cestu.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Nech� t� Innos ochra�uje.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Proroctv� se zmi�uje o posv�tn� Innosov� au�e.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //Proroctv� se zmi�uje o posv�tn� Innosov� au�e.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //Innosova aura je amulet, kter� sm�j� nosit jen nejv�t�� m�gov� sv� doby.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Mohl bych ho dostat?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Co je to za amulet?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //Mohl bych ho dostat?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //Co�e? Co s n�m chce� d�lat?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Postavit se drakovi.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Ano, samoz�ejm�. D�m ti ten amulet, ale zach�zej s n�m opatrn�.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Jo, jasn�.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Nerad bych jej musel pozd�ji vykupovat od n�jak�ho kupce.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Pou��vej ho moud�e, a nech� t� Innos st�le ochra�uje.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //Co je to za amulet?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //��k� se, �e ho ukul s�m Innos a dal jej lidstvu jako dar.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Ochra�uje toho, kdo jej nos�, p�ed jakoukoliv �jmou.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co jsou Innosovy slzy?";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //Co jsou Innosovy slzy?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Innosovy slzy jsou jen sou��st� star� b�chorky pro d�ti. Vypr�v� o tom, jak na po��tku �as� za�ala bitva mezi Innosem a Beliarem.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Aha.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Na�el jsem tenhle lektvar.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Aha.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //Nev�m, jestli si jsi pln� v�dom toho, jak� je na�e situace, ale t�ko dok�u uv��it tomu, �e bys doufal, �e nep��tele poraz�me poh�dkou pro d�ti.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //Na�el jsem tenhle lektvar.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //To nen� mo�n�. Tomu nem��u uv��it.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Co se d�je?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Pokud jsou tohle skute�n� Innosovy slzy, pak...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(sko�� do �e�i) T�ko.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Nep�eru�uj m�. Pokud jsou tohle skute�n� Innosovy slzy, pak m�me proti na�emu nep��teli mocnou zbra�.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Tak co jsou ty Innosovy slzy?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Co mysl� tou 'zbran�'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //Tak co jsou ty Innosovy slzy?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Kdy� si Innos uv�domil, �e aby zachr�nil sv�t, mus� bojovat proti Beliarovi, sv�mu vlastn�mu bratrovi, byl jeho z�rmutek nevysloviteln�.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Za�al plakat a jeho slzy spadly dol� na sv�t. Bylo jich mnoho, proto�e jeho srdce bylo tak pln� z�rmutku, �e plakal cel�ch 13 let.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Jdi p��mo k v�ci.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //V�echny, kdo tyto slzy na�li a okusili je, r�zem naplnila nadp�irozen� s�la a bystrost. Poznali moudrost Innosova stvo�en� a za�ali mu slou�it.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Byli to prvn� �lenov� Spole�enstva ohn�. Ty slzy jim daly s�lu, odvahu a moudrost. Ale to u� bylo velice d�vno, a u� v�ce ne� 250 let nikdo Innosovy slzy nespat�il.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Co mysl� tou "zbran�"?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Legenda vypr�v�, �e pod vlivem t�to l�tky dok�zali Innosovi v�le�n�ci vykon�vat t�m�� nadlidsk� skutky.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Nedotkla se jich ��dn� �nava a byli siln� jako dva medv�di.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Nejv�t�� hrdinsk� �iny star�ch dn� bylo mo�n� vykonat jen s pomoc� Innosov�ch slz.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Rozum�m.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Av�ak ty slzy mohou p�in�st tak� utrpen� a smrt. Tento lektvar mohou p�t jen �lenov� na�eho ��du.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Kohokoliv jin�ho - dokonce i paladiny na�eho P�na - by okam�it� potkala krut� smrt.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
















































































































































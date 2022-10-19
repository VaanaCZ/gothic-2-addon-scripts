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
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_00");//Hej, myslel jsem si, �e jsi mrtv�.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_01");//Ano... to jsem tak� byl.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_02");//Ale te� jsem zp�tky a hled�m d�kaz o tom, �e tady jsou draci.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_03");//Pro� to d�l�?
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_04");//Pracuji pro lorda Hagena. S pomoc� paladin� se n�m ur�it� poda�� draky zastavit.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_05");//Paladinov�? N�co ti �eknu. Kdy� se mi odsud poda�ilo pl�chnout, �el jsem do Khorinidu.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_06");//Cht�l jsem paladiny varovat p�ed draky. Nebesa v�d�, pro� jsem to v�bec zkou�el.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_07");//Ten nadutec Lothar m� ani neposlouchal - a u� v�bec m� nenechal si promluvit s lordem Hagenem.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_08");//M�sto toho m� poslali zp�tky s touhle v�pravou. Tak�e o paladinech mi v�bec nemluv.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_09");//D�le�it� je zastavit draky, dokud m�me �as - a v�bec nez�le�� na tom, kdo n�m k tomu pom��e.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_10");//Zastavit je? M�li bysme vypadnout z tohohle �dol�, dokud m�me �as aspo� na to.
	
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_03");//�ekni, jak se ti poda�ilo dostat se p�es pr�smyk? Myslel jsem, �e se to tam hem�� sk�ety.
	AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_04");//Skrz opu�t�n� d�l vede cesta, kterou sk�eti nehl�daj�.
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_05");//To je dobr� v�d�t. V tom p��pad� se brzy vyd�m do Khorinidu - m�m tam p�r nevy��zen�ch ��t�.
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

	description	= "Pot�ebuji ten d�kaz.";
};                       
FUNC INT DIA_DiegoOw_Beweise_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Beweise_Info()
{	
		//AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_00");//Was wei�t du von Silvestros Erz?
	
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_11"); //Poslouchej, pot�ebuju ten d�kaz.
		
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_14");//Dobr�, ud�l�m pro tebe, co bude v m�ch sil�ch. Ale nebudu za nikoho riskovat krk.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_12");//Dobr�, jestli to je smysl tvoj� cesty - b� si promluvit s velitelem Garondem.
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_13");//Jestli n�kdo v� n�co o �toc�ch drak�, tak to jsou ho�i z hradu.
	};
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_00");//Jsem na cest� z Garondova rozkazu. Pot�ebuje v�d�t, kolik rudy jste zat�m vykutali.
		AI_Output (self ,other,"DIA_DiegoOw_Garond_11_01");//A pak ti d� ten d�kaz, po kter�m tak tou��?
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_02");//P�esn� tak. Tak�e co - m��e� mi n�co ��ct?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Garond_11_01"); //A kdy� u� bude� na hrad�, m��e� Garondovi ��ct n�co, co ho ur�it� hodn� zaujme:
	};
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") <= 1000)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_01"); //Tady vzadu v jeskyni jsou �TY�I bedny s rudou. Narubali j� Silvestrovi chlapi.
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_02"); //Jen a� si pro n� Garond p�ijde a vezme si j� - ale to u� j� tady nebudu.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_01"); //V jeskyni kousek od t�, kde jsem ukryl ty �TY�I bedny rudy. Vyt�ili je Silvestrovi mu�i.
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_02"); //Jen a� si pro n� Garond dojde, j� u� je nepot�ebuju.
	};
	
	Silvestro_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Diego dopravil �TY�I bedny rudy, kterou vyt�ili Silvestrovi mu�i, do bezpe��.");
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
	description = "Jak to, �e jsi u rudy pr�v� ty?";
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
	AI_Output (other ,self,"DIA_DiegoOw_Mine_15_00");//Jak to, �e jsi u rudy pr�v� ty?
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_01");//Byl jsem v Silvestrov� skupin�. T�ili jsme n�kolik dn� a pak za�al b�t Silvestro z ni�eho nic stra�n� nerv�zn�.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_02");//�ekl, �e bysme m�li ukr�t rudu na n�jak� bezpe�n� m�sto.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_03");//No, a proto�e jsem se tehdy u� stejn� chystal pl�chnout, nab�dnul jsem se, �e rudu schov�m.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_04");//A to bylo moje jedin� �t�st�. Horn�ci toti� narazili na p�r d�ln�ch �erv�. ��dn� z nich nep�e�il.
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
	description = "Pokud jde o ty dva mrtv� ryt��e...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Ritter_15_00");//Co ti dva mrtv� ryt��i p�ed tvou skr���?
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_01");//Na�la si je zubat� b�hem bitvy se skupinou ch�apavc�.
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_02");//No, Hornick� �dol� m� svoje vlastn� z�kony. ��kal jsem jim to. Ale necht�li m� poslouchat.
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
	description = "Co bych m�l o �dol� v�d�t?";
};                       
FUNC INT DIA_DiegoOw_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Perm_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Perm_15_00");//Co bych m�l o �dol� v�d�t?
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_01");//Od p�du bari�ry se tady p�r v�c� zm�nilo. Hlavn� slovo tu te� maj� sk�eti.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_02");//My lid� nejsme nic jin�ho ne� �r�dlo pro skute�n� p�ny �dol�: draky.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_03");//Dr� se stranou od v�eho, co je nad tvoje s�ly - a vyh�bej se v�emu, co vypad� jako drak.
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
	description = "R�d bych Gorna vykoupil z v�zen�...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Gorn_15_00");//Cht�l bych vykoupit Gornovi na svobodu, ale Garond za to chce 1000 zlat�ch.
	AI_Output (self ,other,"DIA_DiegoOw_Gorn_11_01");//Hezk� sumi�ka. M�m u sebe 300 zlat�ch, klidn� si je vezmi. Ale zbytek je na tob�.
	
	B_GiveInvItems (self, other, ItmI_Gold, 300);
	
	B_LogEntry (TOPIC_RescueGorn,"Diego mi zaplatil 300, abych Gornovi pomohl na svobodu.");
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
	description = "M��e� m� n��emu nau�it?";
};                       
func INT DIA_DiegoOw_Teach_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_DiegoOw_Teach_info ()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Teach_15_00");//M��e� m� n��emu nau�it?
	AI_Output (self, other,"DIA_Addon_DiegoOw_Teach_11_01");//Jasn�, co bys r�d v�d�l?
		
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
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //Trochu obratnosti u� jsi z�skal.
	};
	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //(odhadn�) Dob�e. Tv� s�la se zv��ila.
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

	description	= 	"Poj�me spolu.";
};
func int DIA_Addon_ThiefOW_Together_Condition ()
{
	return TRUE;
};
func void DIA_Addon_ThiefOW_Together_Info ()
{
	AI_Output (other, self,	"DIA_Addon_Diego_Together_15_00"); //Tak poj�me spolu.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_01"); //Do pr�smyku? Pro� ne.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_02"); //B� prvn�. Sotva jsi odsud p�i�el.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_03"); //Ale a� t� ani nenapadne se moc p�ibli�ovat k hradu nebo ke sk�et� palis�d�.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_04"); //A taky se vyh�bej opevn�n�m t�bor�m paladin�.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_05"); //Pr�v� jsem z jednoho utekl a rozhodn� se nehodl�m d��t do �moru n�kde v dole.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_06"); //A snad ani nemus�m zmi�ovat, �e by ses nem�l p�ibli�ovat k ��dn�mu z drak�.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_07"); //Dej mi v�d�t, a� bude� p�ipravenej.
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
	description	= 	"Poj� se mnou.";
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
	AI_Output (other, self, "DIA_Addon_Diego_ComeOn_15_00"); //Poj� se mnou.
	
	if (C_DiegoTooFar(0))
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_01"); //Tudy ne!

		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_02"); //Dob�e.

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
	description = "Po�kej tady.";
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
	AI_Output (other, self,"DIA_Addon_Diego_WarteHier_15_00"); //Po�kej tady!
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") < 2000)
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_01"); //Fajn. 
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else if (Npc_GetDistToWP (self, "DT_E1_04") < (1500+1000)) //XARDAS
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_02"); //Po�k�m u t� v�e venku.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"XARDAS");
	}
	else if (Npc_GetDistToWP (self, "OW_NEWMINE_11") < (4000+1000)) //FAJETHMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_03"); //Po�k�m u dolu.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"FAJETH");
	}
	else if (Npc_GetDistToWP (self, "OW_MINE3_OUT") < (1200+1000)) //SILVESTROMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_04"); //Po�k�m p��mo p�ed dolem.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"SILVESTRO");
	}
	else if (Npc_GetDistToWP (self, "OW_PATH_266") < (3000+1000)) //GRIMESMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_05"); //Po�k�m tady kousek.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"GRIMES");
	}
	else if (Npc_GetDistToWP (self, "LOCATION_02_05") < 15000) //Orcbarrier FIRE ANGAR LAKE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_06"); //Ne. Vr�t�m se zp�tky do jeskyn�.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_07"); //A� tu skon��, zajdi za mnou.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_08"); //Ale moc dlouho neot�lej, nebo se vr�t�m s�m.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else //zu weit weg
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_09"); //D�l� si srandu? To se m�me rozd�lit? Tady?
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_10"); //Jen p�es mou mrtvolu!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_11"); //P�jdeme te� do pr�smyku - spolu.
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_00"); //B� prvn� a omrkni to tam - j� po�k�m venku.
};
// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_01"); //Do pr�smyku se jde jinudy!
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_02"); //Na t�hle hrobce je n�co stra�ideln�ho.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_03"); //Rad�i bysme to m�li obej�t.
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_04"); //To je vchod do b�val�ho Nov�ho t�bora. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_05"); //Ur�it� se tam usadil n�jakej drak.
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_06"); //Ba�ina je slep� uli�ka.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_07"); //Nep�ekvapilo by m�, kdyby se v n� us�dlil n�jakej drak.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_08"); //Necho�me tam.
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_09"); //Kdy� p�jdeme po��d nahoru, ur�it� potk�me draka.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_10"); //A j� bych se r�d dostal do Khorinidu �IVEJ.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_11"); //Vezm�me to jinudy.
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_12"); //Tohle jezero n�s nikam nedovede.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_13"); //Do pr�smyku mus�me j�t jinudy!
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_14"); //Tohle je star� Xardasova v�. Ale pochopiteln� ji opustil u� d�vno.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_15"); //Ur�it� tam narafi�il spoustu nep��jemnejch p�ekvapen�. 
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_16"); //Tamhle je Fajeth�v d�l.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_17"); //Jestli chce� j�t dovnit�, tak m� vynech!
			Diego_FajethVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_18"); //J� bych se tomu dolu vyh�bal na sto hon�!
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_19"); //P�esn� do tohohle dolu m� odvlekli i s ostatn�ma trestancema.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_20"); //V�m ur�it�, �e NIKDO nep�e�il.
			B_Addon_Diego_WillWaitOutside();
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //Ale kdy� ti to potrv� moc dlouho, vr�t�m se do sv�ho t�bora.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //Pokud teda nechce�, abych tu na tebe po�kal.
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_21"); //Tohle je jeden z novejch paladinskejch dol�. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_22"); //Nikdy jsem tam nebyl, a ani o to nestoj�m.
			Diego_GrimesVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_23"); //Od tohohle dolu se rad�i dr�me d�l.
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_24"); //Se� snad sebevrah, nebo co? Od toho hradu se dr� hezky daleko!
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{	
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_25"); //Hele, poslouch� m� v�bec?! Dr� se od toho hradu d�l!
			Diego_BurgVariation = 2;
		}
		else //2
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_26"); //Copak nerozum� �esky? 'Od toho hradu d�l'! Je to tak nepochopiteln�, nebo co?
			Diego_BurgVariation = 1;
		};	
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_27"); //Tady u� d�l nem��eme. Sk�et� bari�ra je p��li� nebezpe�n�.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_28"); //Mysl�m, �e bude lep��, kdy� to te� st�ihneme k z�padu a obejdeme to z druh� strany.
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_29"); //Kdybychom pokra�ovali tudy, jen bysme zase narazili na sk�et� bari�ru.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_30"); //Vzh�ru do pr�smyku!
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_02"); //D�l u� p�jdu s�m.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_03"); //Je�t� si mus�m p�r v�c� za��dit, ne� se vr�t�m do Khorinidu.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_04"); //D�ky, kamar�de. Uvid�me se ve m�st�.
	
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
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_01"); //Tak a jsme tu.
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
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //Pamatuje�?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //Jak jsme se potkali poprv�?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //U� je to tak dlouho...
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //Ale tady b�valo n�co JIN�HO... Hmm, sakra! U� si to nepamatuju!
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_05"); //To je fuk.
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
	description = "Je v�echno v po��dku?";
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
	AI_Output (other ,self,"DIA_Addon_Diego_PERM_15_00"); //Jak se vede?
	if (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_01"); //Hodil by se mi l��ivej lektvar, nem�l bys n�jakej?
	}
	else if (DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& 		(Diego_angekommen == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_02"); //Tak mi �ekni, a� bude� cht�t vyrazit.
	}
	else if (Diego_angekommen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_03"); //Fajn, jen si chvilku oddychnu.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_04"); //Fajn.
	};
};



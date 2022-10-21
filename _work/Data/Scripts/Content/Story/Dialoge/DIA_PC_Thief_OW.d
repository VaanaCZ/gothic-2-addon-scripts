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
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_00");//Hej, my�la�em, �e nie �yjesz.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_01");//Taa... te� tak my�la�em.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_02");//Ale wr�ci�em i szukam dowodu na pojawienie si� smok�w.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_03");//Czy�by? A dla kogo pracujesz?
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_04");//Dla Lorda Hagena. Tylko paladyni mog� powstrzyma� smoki.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_05");//Paladyni?! Co� ci powiem. Kiedy uda�o mi si� st�d uciec, poszed�em do Khorinis.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_06");//Zamierza�em uprzedzi� paladyn�w o smokach. Nie wiem, po co w og�le pr�bowa�em.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_07");//Ten nad�ty g�upiec, Lothar, nawet nie chcia� mnie wys�ucha�, a ju� na pewno nie zamierza� dopu�ci� mnie przed oblicze Hagena.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_08");//Wys�ali mnie tylko ze swoj� ekspedycj�. Wi�c nie m�w mi, jakim to wybawieniem s� paladyni...
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_09");//Tak czy inaczej - smoki trzeba powstrzyma�, p�ki jeszcze jest czas. Niewa�ne, kto tego dokona.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_10");//Powstrzyma�? Chyba �artujesz? Musimy si� wynosi� z tej doliny, ot co!
	
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_03");//Powiedz, jak uda�o ci si� przej�� przez prze��cz? My�la�em, �e a� roi si� od ork�w.
	AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_04");//Przez opuszczon� kopalni� prowadzi �cie�ka, na kt�rej nie ma ork�w.
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_05");//Dobrze wiedzie�. Zatem nied�ugo wyrusz� do Khorinis. Mam tam par� rachunk�w do wyr�wnania.
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

	description	= "Potrzebuj� dowodu na ich istnienie.";
};                       
FUNC INT DIA_DiegoOw_Beweise_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Beweise_Info()
{	
		//AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_00");//Was wei�t du von Silvestros Erz?
	
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_11"); //Potrzebuj� dowodu na ich istnienie.
		
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_14");//Dobra, pomog� ci w miar� mo�liwo�ci. Ale nie zamierzam za nikogo nadstawia� karku, jasne?
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_12");//C�, skoro nalegasz. Porozmawiaj z kapitanem Garondem.
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_13");//Je�li kto� mo�e potwierdzi� obecno�� smok�w, to w�a�nie ch�opcy z zamku.
	};
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_00");//Garond wys�a� mnie z pewn� misj�. Chce wiedzie�, ile rudy wydobyto do tej pory.
		AI_Output (self ,other,"DIA_DiegoOw_Garond_11_01");//A potem da ci dow�d, kt�rego tak potrzebujesz?
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_02");//W�a�nie. Wi�c jak, mo�esz mi co� powiedzie�?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Garond_11_01"); //Jak ju� b�dziesz na zamku, to daj zna� Garondowi o pewnej sprawie, kt�ra go chyba bardzo zainteresuje...
	};
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") <= 1000)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_01"); //Na dnie tej jaskini s� CZTERY skrzynie rudy. Wydobyli j� ludzie Silvestra.
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_02"); //Je�li Garond zechce, mo�e tu przyj�� i je sobie wzi��, ale mnie tu ju� wtedy nie b�dzie.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_01"); //Niedaleko od jaskini, w kt�rej si� ukrywa�em, znajduj� si� a� CZTERY skrzynie pe�ne rudy. Wydobyli j� ludzie Silvestro.
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_02"); //Niech je sobie Garond bierze - mnie si� i tak nie przydadz�.
	};
	
	Silvestro_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Diego zabezpieczy� CZTERY skrzynie rudy wydobytej przez g�rnik�w Silvestra.");
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
	description = "W jaki spos�b zdoby�e� t� rud�?";
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
	AI_Output (other ,self,"DIA_DiegoOw_Mine_15_00");//W jaki spos�b zdoby�e� t� rud�?
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_01");//By�em w oddziale Silvestra. Przez kilka dni prowadzili�my wydobycie, a� Silvestro zrobi� si� nagle strasznie nerwowy.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_02");//Powiedzia�, �e musimy zabra� urobek w bezpieczne miejsce.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_03");//Jako �e od pewnego czasu planowa�em da� nog�, zg�osi�em si� na ochotnika.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_04");//I dobrze zrobi�em, bo g�rnicy wpadli wkr�tce potem na stado pe�zaczy. Nikt nie prze�y�.
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
	description = "Przed twoj� kryj�wk� le�� zw�oki dw�ch rycerzy...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Ritter_15_00");//Przed twoj� kryj�wk� le�� zw�oki dw�ch rycerzy...
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_01");//Polegli bohatersko w walce ze stadem z�baczy.
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_02");//G�rnicza Dolina rz�dzi si� w�asnymi prawami. Ostrzega�em ich, ale nie chcieli mnie s�ucha�.
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
	description = "Co powinienem wiedzie� o dolinie?";
};                       
FUNC INT DIA_DiegoOw_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Perm_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Perm_15_00");//Co powinienem wiedzie� o dolinie?
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_01");//Od upadku Bariery sporo si� pozmienia�o. Teraz rz�dz� tu orkowie.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_02");//A ludzie s� tylko �yw� karm� dla prawdziwych w�adc�w doliny: smok�w.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_03");//Trzymaj si� z dala od wszystkiego, co jest silniejsze od ciebie, zw�aszcza je�li przypomina z wygl�du smoka.
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
	description = "Chcia�bym wykupi� Gorna...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Gorn_15_00");//Chcia�bym wykupi� Gorna, ale Garond domaga si� za niego 1000 sztuk z�ota.
	AI_Output (self ,other,"DIA_DiegoOw_Gorn_11_01");//Niez�a sumka. Mam przy sobie 300 sztuk, mo�esz je wzi��, je�li chcesz. Reszt� musisz zdoby� sam.
	
	B_GiveInvItems (self, other, ItmI_Gold, 300);
	
	B_LogEntry (TOPIC_RescueGorn,"Diego przekaza� 300 sztuk z�ota na uwolnienie Gorna.");
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
	description = "Mo�esz mnie czego� nauczy�?";
};                       
func INT DIA_DiegoOw_Teach_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_DiegoOw_Teach_info ()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Teach_15_00");//Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"DIA_Addon_DiegoOw_Teach_11_01");//Jasne. W czym mog� ci pom�c?
		
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
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //Nabierasz zr�czno�ci.
	};
	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //Dobrze - twoja si�a wzrasta.
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

	description	= 	"Chod� ze mn�.";
};
func int DIA_Addon_ThiefOW_Together_Condition ()
{
	return TRUE;
};
func void DIA_Addon_ThiefOW_Together_Info ()
{
	AI_Output (other, self,	"DIA_Addon_Diego_Together_15_00"); //Chod� ze mn�.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_01"); //Na prze��cz? Czemu nie...
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_02"); //Id�. W ko�cu w�a�nie stamt�d przybywasz.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_03"); //Nie wa� si� jednak podej�� zbyt blisko do zamku lub orkowej palisady.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_04"); //Rozs�dnie te� b�dzie unika� obozu paladyn�w.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_05"); //Dopiero co z jednego z nich uciek�em - nie mam ochoty zn�w zosta� niewolnikiem tyraj�cym w kopalniach.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_06"); //Rzecz jasna nale�y unika� r�wnie� spotka� ze smokiem.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_07"); //Daj zna�, gdy wszystko b�dzie gotowe.
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
	description	= 	"Chod�my.";
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
	AI_Output (other, self, "DIA_Addon_Diego_ComeOn_15_00"); //Chod�my.
	
	if (C_DiegoTooFar(0))
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_01"); //To nie ten kierunek!

		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_02"); //Dobrze.

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
	description = "Poczekaj tutaj!";
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
	AI_Output (other, self,"DIA_Addon_Diego_WarteHier_15_00"); //Poczekaj tutaj!
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") < 2000)
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_01"); //Dobra. 
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else if (Npc_GetDistToWP (self, "DT_E1_04") < (1500+1000)) //XARDAS
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_02"); //Poczekam przed wej�ciem do wie�y.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"XARDAS");
	}
	else if (Npc_GetDistToWP (self, "OW_NEWMINE_11") < (4000+1000)) //FAJETHMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_03"); //Zaczekam w pobli�u kopalni.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"FAJETH");
	}
	else if (Npc_GetDistToWP (self, "OW_MINE3_OUT") < (1200+1000)) //SILVESTROMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_04"); //B�d� czeka� przed kopalni�.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"SILVESTRO");
	}
	else if (Npc_GetDistToWP (self, "OW_PATH_266") < (3000+1000)) //GRIMESMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_05"); //Poczekam tu w okolicy.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"GRIMES");
	}
	else if (Npc_GetDistToWP (self, "LOCATION_02_05") < 15000) //Orcbarrier FIRE ANGAR LAKE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_06"); //Nie - wracam do jaskini.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_07"); //Zajrzyj do mnie, gdy ju� za�atwisz swoje sprawy.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_08"); //Je�li jednak zamarudzisz zbyt d�ugo, zajm� si� w�asnymi sprawami.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else //zu weit weg
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_09"); //Chyba sobie kpisz! Rozsta� si�? Tutaj?!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_10"); //Nie ma mowy!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_11"); //Musimy i�� razem na prze��cz i tyle.
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_00"); //Chcesz si� tutaj rozejrze�? Dobra, ja poczekam na zewn�trz.
};
// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_01"); //Prze��cz le�y w przeciwnym kierunku...
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_02"); //Nie podoba mi si� ten gr�b.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_03"); //Chyba lepiej to obej��.
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_04"); //To wej�cie do dawnego Nowego Obozu. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_05"); //Jestem przekonany, �e osiedli� si� tu smok.
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_06"); //To bagno to �lepy zau�ek.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_07"); //Nie zdziwi� si�, je�li b�dzie tu na nas czeka� smok...
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_08"); //Lepiej si� tam nie zapuszcza�.
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_09"); //Za�o�� si�, �e w razie dalszej wspinaczki wpadniemy na smoka.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_10"); //A nie wiem jak ty, ale ja wola�bym dosta� si� do Khorinis w jednym kawa�ku.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_11"); //Wybierzmy lepiej inn� drog�.
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_12"); //To jezioro nigdzie nas nie doprowadzi.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_13"); //Prze��cz le�y w przeciwnym kierunku...
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_14"); //To stara wie�a Xardasa, cho� opu�ci� j� ju� jaki� czas temu.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_15"); //Nie zdziwi�bym si�, gdyby wewn�trz czeka�y na nas jakie� nieprzyjemne niespodzianki... 
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_16"); //Tam jest kopalnia Fajetha.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_17"); //Tam chcesz i��? Beze mnie!
			Diego_FajethVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_18"); //Wola�bym raczej obej�� t� kopalni�!
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_19"); //To w tej kopalni przymusowo pracowa�em.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_20"); //Jestem ca�kowicie pewien, �e nie pozosta� tam nikt �ywy.
			B_Addon_Diego_WillWaitOutside();
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //Wr�c� do siebie, je�li za d�ugo b�dziesz tam siedzia�.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //Chyba �e wolisz, abym tu poczeka� na tw�j powr�t.
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_21"); //To jedna z nowych kopal� paladyn�w. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_22"); //Nigdy tu nie by�em - i chcia�bym, aby tak zosta�o.
			Diego_GrimesVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_23"); //Wol� nie zapuszcza� si� do tej kopalni.
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_24"); //Odwali�o ci? Nie zbli�aj si� do tego zamku!
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{	
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_25"); //W og�le mnie nie s�uchasz? Nie zbli�aj si� do tego zamku!
			Diego_BurgVariation = 2;
		}
		else //2
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_26"); //Cholera - naprawd� nie rozumiesz prostego zdania?! NIE ZBLI�AJ SI� DO ZAMKU!
			Diego_BurgVariation = 1;
		};	
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_27"); //Nie mo�emy dalej i�� w tym kierunku! Przy orkowym murze jest zbyt niebezpiecznie.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_28"); //Lepiej chyba zwr�ci� si� na zach�d i tam poszuka� dogodnego przej�cia.
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_29"); //Id�c dalej t� �cie�k�, zbli�ymy si� tylko ponownie do orkowego muru.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_30"); //Ruszajmy ku prze��czy!
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_02"); //Pozosta�� cz�� drogi zalicz� ju� sam.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_03"); //Musz� za�atwi� par� spraw, zanim p�jd� do Khorinis.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_04"); //Dzi�kuj� ci, przyjacielu - do zobaczenia w mie�cie.
	
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
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_01"); //Jeste�my na miejscu.
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
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //Pami�tasz?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //To miejsce, w kt�rym po raz pierwszy si� spotkali�my.
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //To by�o tak dawno...
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //Hmm... By�o jeszcze co� wyj�tkowego w tej okolicy, tylko nie pami�tam dok�adnie co.
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_05"); //Skoro tak twierdzisz...
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
	description = "Wszystko w porz�dku?";
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
	AI_Output (other ,self,"DIA_Addon_Diego_PERM_15_00"); //Wszystko w porz�dku?
	if (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_01"); //Przyda�by mi si� eliksir leczniczy. Nie masz przypadkiem jakiego� na zbyciu?
	}
	else if (DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& 		(Diego_angekommen == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_02"); //Daj zna�, gdy trzeba ju� b�dzie rusza�.
	}
	else if (Diego_angekommen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_03"); //Tak sobie tylko odpoczywam.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_04"); //�wietnie.
	};
};



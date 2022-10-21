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
//				Begrüssung
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
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_00");//Hej, myœla³em, ¿e nie ¿yjesz.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_01");//Taa... te¿ tak myœla³em.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_02");//Ale wróci³em i szukam dowodu na pojawienie siê smoków.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_03");//Czy¿by? A dla kogo pracujesz?
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_04");//Dla Lorda Hagena. Tylko paladyni mog¹ powstrzymaæ smoki.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_05");//Paladyni?! Coœ ci powiem. Kiedy uda³o mi siê st¹d uciec, poszed³em do Khorinis.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_06");//Zamierza³em uprzedziæ paladynów o smokach. Nie wiem, po co w ogóle próbowa³em.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_07");//Ten nadêty g³upiec, Lothar, nawet nie chcia³ mnie wys³uchaæ, a ju¿ na pewno nie zamierza³ dopuœciæ mnie przed oblicze Hagena.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_08");//Wys³ali mnie tylko ze swoj¹ ekspedycj¹. Wiêc nie mów mi, jakim to wybawieniem s¹ paladyni...
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_09");//Tak czy inaczej - smoki trzeba powstrzymaæ, póki jeszcze jest czas. Niewa¿ne, kto tego dokona.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_10");//Powstrzymaæ? Chyba ¿artujesz? Musimy siê wynosiæ z tej doliny, ot co!
	
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_03");//Powiedz, jak uda³o ci siê przejœæ przez prze³êcz? Myœla³em, ¿e a¿ roi siê od orków.
	AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_04");//Przez opuszczon¹ kopalniê prowadzi œcie¿ka, na której nie ma orków.
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_05");//Dobrze wiedzieæ. Zatem nied³ugo wyruszê do Khorinis. Mam tam parê rachunków do wyrównania.
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

	description	= "Potrzebujê dowodu na ich istnienie.";
};                       
FUNC INT DIA_DiegoOw_Beweise_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Beweise_Info()
{	
		//AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_00");//Was weißt du von Silvestros Erz?
	
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_11"); //Potrzebujê dowodu na ich istnienie.
		
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_14");//Dobra, pomogê ci w miarê mo¿liwoœci. Ale nie zamierzam za nikogo nadstawiaæ karku, jasne?
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_12");//Có¿, skoro nalegasz. Porozmawiaj z kapitanem Garondem.
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_13");//Jeœli ktoœ mo¿e potwierdziæ obecnoœæ smoków, to w³aœnie ch³opcy z zamku.
	};
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_00");//Garond wys³a³ mnie z pewn¹ misj¹. Chce wiedzieæ, ile rudy wydobyto do tej pory.
		AI_Output (self ,other,"DIA_DiegoOw_Garond_11_01");//A potem da ci dowód, którego tak potrzebujesz?
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_02");//W³aœnie. Wiêc jak, mo¿esz mi coœ powiedzieæ?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Garond_11_01"); //Jak ju¿ bêdziesz na zamku, to daj znaæ Garondowi o pewnej sprawie, która go chyba bardzo zainteresuje...
	};
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") <= 1000)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_01"); //Na dnie tej jaskini s¹ CZTERY skrzynie rudy. Wydobyli j¹ ludzie Silvestra.
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_02"); //Jeœli Garond zechce, mo¿e tu przyjœæ i je sobie wzi¹æ, ale mnie tu ju¿ wtedy nie bêdzie.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_01"); //Niedaleko od jaskini, w której siê ukrywa³em, znajduj¹ siê a¿ CZTERY skrzynie pe³ne rudy. Wydobyli j¹ ludzie Silvestro.
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_02"); //Niech je sobie Garond bierze - mnie siê i tak nie przydadz¹.
	};
	
	Silvestro_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Diego zabezpieczy³ CZTERY skrzynie rudy wydobytej przez górników Silvestra.");
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
	description = "W jaki sposób zdoby³eœ tê rudê?";
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
	AI_Output (other ,self,"DIA_DiegoOw_Mine_15_00");//W jaki sposób zdoby³eœ tê rudê?
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_01");//By³em w oddziale Silvestra. Przez kilka dni prowadziliœmy wydobycie, a¿ Silvestro zrobi³ siê nagle strasznie nerwowy.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_02");//Powiedzia³, ¿e musimy zabraæ urobek w bezpieczne miejsce.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_03");//Jako ¿e od pewnego czasu planowa³em daæ nogê, zg³osi³em siê na ochotnika.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_04");//I dobrze zrobi³em, bo górnicy wpadli wkrótce potem na stado pe³zaczy. Nikt nie prze¿y³.
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
	description = "Przed twoj¹ kryjówk¹ le¿¹ zw³oki dwóch rycerzy...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Ritter_15_00");//Przed twoj¹ kryjówk¹ le¿¹ zw³oki dwóch rycerzy...
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_01");//Polegli bohatersko w walce ze stadem zêbaczy.
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_02");//Górnicza Dolina rz¹dzi siê w³asnymi prawami. Ostrzega³em ich, ale nie chcieli mnie s³uchaæ.
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
	description = "Co powinienem wiedzieæ o dolinie?";
};                       
FUNC INT DIA_DiegoOw_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Perm_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Perm_15_00");//Co powinienem wiedzieæ o dolinie?
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_01");//Od upadku Bariery sporo siê pozmienia³o. Teraz rz¹dz¹ tu orkowie.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_02");//A ludzie s¹ tylko ¿yw¹ karm¹ dla prawdziwych w³adców doliny: smoków.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_03");//Trzymaj siê z dala od wszystkiego, co jest silniejsze od ciebie, zw³aszcza jeœli przypomina z wygl¹du smoka.
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
	description = "Chcia³bym wykupiæ Gorna...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Gorn_15_00");//Chcia³bym wykupiæ Gorna, ale Garond domaga siê za niego 1000 sztuk z³ota.
	AI_Output (self ,other,"DIA_DiegoOw_Gorn_11_01");//Niez³a sumka. Mam przy sobie 300 sztuk, mo¿esz je wzi¹æ, jeœli chcesz. Resztê musisz zdobyæ sam.
	
	B_GiveInvItems (self, other, ItmI_Gold, 300);
	
	B_LogEntry (TOPIC_RescueGorn,"Diego przekaza³ 300 sztuk z³ota na uwolnienie Gorna.");
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       
func INT DIA_DiegoOw_Teach_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_DiegoOw_Teach_info ()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Teach_15_00");//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"DIA_Addon_DiegoOw_Teach_11_01");//Jasne. W czym mogê ci pomóc?
		
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
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //Nabierasz zrêcznoœci.
	};
	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //Dobrze - twoja si³a wzrasta.
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

	description	= 	"ChodŸ ze mn¹.";
};
func int DIA_Addon_ThiefOW_Together_Condition ()
{
	return TRUE;
};
func void DIA_Addon_ThiefOW_Together_Info ()
{
	AI_Output (other, self,	"DIA_Addon_Diego_Together_15_00"); //ChodŸ ze mn¹.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_01"); //Na prze³êcz? Czemu nie...
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_02"); //IdŸ. W koñcu w³aœnie stamt¹d przybywasz.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_03"); //Nie wa¿ siê jednak podejœæ zbyt blisko do zamku lub orkowej palisady.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_04"); //Rozs¹dnie te¿ bêdzie unikaæ obozu paladynów.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_05"); //Dopiero co z jednego z nich uciek³em - nie mam ochoty znów zostaæ niewolnikiem tyraj¹cym w kopalniach.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_06"); //Rzecz jasna nale¿y unikaæ równie¿ spotkañ ze smokiem.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_07"); //Daj znaæ, gdy wszystko bêdzie gotowe.
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
	description	= 	"ChodŸmy.";
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
	AI_Output (other, self, "DIA_Addon_Diego_ComeOn_15_00"); //ChodŸmy.
	
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
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_02"); //Poczekam przed wejœciem do wie¿y.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"XARDAS");
	}
	else if (Npc_GetDistToWP (self, "OW_NEWMINE_11") < (4000+1000)) //FAJETHMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_03"); //Zaczekam w pobli¿u kopalni.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"FAJETH");
	}
	else if (Npc_GetDistToWP (self, "OW_MINE3_OUT") < (1200+1000)) //SILVESTROMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_04"); //Bêdê czekaæ przed kopalni¹.
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
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_07"); //Zajrzyj do mnie, gdy ju¿ za³atwisz swoje sprawy.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_08"); //Jeœli jednak zamarudzisz zbyt d³ugo, zajmê siê w³asnymi sprawami.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else //zu weit weg
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_09"); //Chyba sobie kpisz! Rozstaæ siê? Tutaj?!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_10"); //Nie ma mowy!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_11"); //Musimy iœæ razem na prze³êcz i tyle.
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_00"); //Chcesz siê tutaj rozejrzeæ? Dobra, ja poczekam na zewn¹trz.
};
// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_01"); //Prze³êcz le¿y w przeciwnym kierunku...
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_02"); //Nie podoba mi siê ten grób.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_03"); //Chyba lepiej to obejœæ.
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_04"); //To wejœcie do dawnego Nowego Obozu. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_05"); //Jestem przekonany, ¿e osiedli³ siê tu smok.
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_06"); //To bagno to œlepy zau³ek.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_07"); //Nie zdziwiê siê, jeœli bêdzie tu na nas czeka³ smok...
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_08"); //Lepiej siê tam nie zapuszczaæ.
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_09"); //Za³o¿ê siê, ¿e w razie dalszej wspinaczki wpadniemy na smoka.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_10"); //A nie wiem jak ty, ale ja wola³bym dostaæ siê do Khorinis w jednym kawa³ku.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_11"); //Wybierzmy lepiej inn¹ drogê.
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_12"); //To jezioro nigdzie nas nie doprowadzi.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_13"); //Prze³êcz le¿y w przeciwnym kierunku...
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_14"); //To stara wie¿a Xardasa, choæ opuœci³ j¹ ju¿ jakiœ czas temu.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_15"); //Nie zdziwi³bym siê, gdyby wewn¹trz czeka³y na nas jakieœ nieprzyjemne niespodzianki... 
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_17"); //Tam chcesz iœæ? Beze mnie!
			Diego_FajethVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_18"); //Wola³bym raczej obejœæ tê kopalniê!
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_19"); //To w tej kopalni przymusowo pracowa³em.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_20"); //Jestem ca³kowicie pewien, ¿e nie pozosta³ tam nikt ¿ywy.
			B_Addon_Diego_WillWaitOutside();
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //Wrócê do siebie, jeœli za d³ugo bêdziesz tam siedzia³.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //Chyba ¿e wolisz, abym tu poczeka³ na twój powrót.
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_21"); //To jedna z nowych kopalñ paladynów. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_22"); //Nigdy tu nie by³em - i chcia³bym, aby tak zosta³o.
			Diego_GrimesVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_23"); //Wolê nie zapuszczaæ siê do tej kopalni.
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_24"); //Odwali³o ci? Nie zbli¿aj siê do tego zamku!
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{	
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_25"); //W ogóle mnie nie s³uchasz? Nie zbli¿aj siê do tego zamku!
			Diego_BurgVariation = 2;
		}
		else //2
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_26"); //Cholera - naprawdê nie rozumiesz prostego zdania?! NIE ZBLI¯AJ SIÊ DO ZAMKU!
			Diego_BurgVariation = 1;
		};	
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_27"); //Nie mo¿emy dalej iœæ w tym kierunku! Przy orkowym murze jest zbyt niebezpiecznie.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_28"); //Lepiej chyba zwróciæ siê na zachód i tam poszukaæ dogodnego przejœcia.
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_29"); //Id¹c dalej t¹ œcie¿k¹, zbli¿ymy siê tylko ponownie do orkowego muru.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_30"); //Ruszajmy ku prze³êczy!
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_02"); //Pozosta³¹ czêœæ drogi zaliczê ju¿ sam.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_03"); //Muszê za³atwiæ parê spraw, zanim pójdê do Khorinis.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_04"); //Dziêkujê ci, przyjacielu - do zobaczenia w mieœcie.
	
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
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_01"); //Jesteœmy na miejscu.
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
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //Pamiêtasz?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //To miejsce, w którym po raz pierwszy siê spotkaliœmy.
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //To by³o tak dawno...
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //Hmm... By³o jeszcze coœ wyj¹tkowego w tej okolicy, tylko nie pamiêtam dok³adnie co.
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
	description = "Wszystko w porz¹dku?";
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
	AI_Output (other ,self,"DIA_Addon_Diego_PERM_15_00"); //Wszystko w porz¹dku?
	if (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_01"); //Przyda³by mi siê eliksir leczniczy. Nie masz przypadkiem jakiegoœ na zbyciu?
	}
	else if (DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& 		(Diego_angekommen == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_02"); //Daj znaæ, gdy trzeba ju¿ bêdzie ruszaæ.
	}
	else if (Diego_angekommen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_03"); //Tak sobie tylko odpoczywam.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_04"); //Œwietnie.
	};
};



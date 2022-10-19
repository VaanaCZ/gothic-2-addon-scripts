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
//				Begr¸ssung
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
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_00");//Hej, myslel jsem si, ûe jsi mrtv˝.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_01");//Ano... to jsem takÈ byl.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_02");//Ale teÔ jsem zp·tky a hled·m d˘kaz o tom, ûe tady jsou draci.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_03");//ProË to dÏl·ö?
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_04");//Pracuji pro lorda Hagena. S pomocÌ paladin˘ se n·m urËitÏ poda¯Ì draky zastavit.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_05");//PaladinovÈ? NÏco ti ¯eknu. Kdyû se mi odsud poda¯ilo pl·chnout, öel jsem do Khorinidu.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_06");//ChtÏl jsem paladiny varovat p¯ed draky. Nebesa vÏdÌ, proË jsem to v˘bec zkouöel.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_07");//Ten nadutec Lothar mÏ ani neposlouchal - a uû v˘bec mÏ nenechal si promluvit s lordem Hagenem.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_08");//MÌsto toho mÏ poslali zp·tky s touhle v˝pravou. Takûe o paladinech mi v˘bec nemluv.
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_09");//D˘leûitÈ je zastavit draky, dokud m·me Ëas - a v˘bec nez·leûÌ na tom, kdo n·m k tomu pom˘ûe.
	AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_10");//Zastavit je? MÏli bysme vypadnout z tohohle ˙dolÌ, dokud m·me Ëas aspoÚ na to.
	
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_03");//ÿekni, jak se ti poda¯ilo dostat se p¯es pr˘smyk? Myslel jsem, ûe se to tam hemûÌ sk¯ety.
	AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_04");//Skrz opuötÏn˝ d˘l vede cesta, kterou sk¯eti nehlÌdajÌ.
	AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_05");//To je dobr˝ vÏdÏt. V tom p¯ÌpadÏ se brzy vyd·m do Khorinidu - m·m tam p·r nevy¯Ìzen˝ch ˙Ët˘.
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

	description	= "Pot¯ebuji ten d˘kaz.";
};                       
FUNC INT DIA_DiegoOw_Beweise_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Beweise_Info()
{	
		//AI_Output (other ,self,"DIA_DiegoOw_Silvestro_15_00");//Was weiﬂt du von Silvestros Erz?
	
	AI_Output (other ,self,"DIA_DiegoOw_Hallo_15_11"); //Poslouchej, pot¯ebuju ten d˘kaz.
		
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_14");//Dobr·, udÏl·m pro tebe, co bude v m˝ch sil·ch. Ale nebudu za nikoho riskovat krk.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_12");//Dobr·, jestli to je smysl tvojÌ cesty - bÏû si promluvit s velitelem Garondem.
		AI_Output (self ,other,"DIA_DiegoOw_Hallo_11_13");//Jestli nÏkdo vÌ nÏco o ˙tocÌch drak˘, tak to jsou hoöi z hradu.
	};
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_00");//Jsem na cestÏ z Garondova rozkazu. Pot¯ebuje vÏdÏt, kolik rudy jste zatÌm vykutali.
		AI_Output (self ,other,"DIA_DiegoOw_Garond_11_01");//A pak ti d· ten d˘kaz, po kter˝m tak touûÌö?
		AI_Output (other ,self,"DIA_DiegoOw_Garond_15_02");//P¯esnÏ tak. Takûe co - m˘ûeö mi nÏco ¯Ìct?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Garond_11_01"); //A kdyû uû budeö na hradÏ, m˘ûeö Garondovi ¯Ìct nÏco, co ho urËitÏ hodnÏ zaujme:
	};
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") <= 1000)
	{
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_01"); //Tady vzadu v jeskyni jsou »TYÿI bedny s rudou. Narubali jÌ Silvestrovi chlapi.
		AI_Output (self ,other,"DIA_DiegoOw_Silvestro_11_02"); //Jen aù si pro nÌ Garond p¯ijde a vezme si jÌ - ale to uû j· tady nebudu.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_01"); //V jeskyni kousek od tÈ, kde jsem ukryl ty »TYÿI bedny rudy. VytÏûili je Silvestrovi muûi.
		AI_Output (self ,other,"DIA_Addon_DiegoOw_Silvestro_11_02"); //Jen aù si pro nÏ Garond dojde, j· uû je nepot¯ebuju.
	};
	
	Silvestro_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Diego dopravil »TYÿI bedny rudy, kterou vytÏûili Silvestrovi muûi, do bezpeËÌ.");
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
	description = "Jak to, ûe jsi u rudy pr·vÏ ty?";
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
	AI_Output (other ,self,"DIA_DiegoOw_Mine_15_00");//Jak to, ûe jsi u rudy pr·vÏ ty?
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_01");//Byl jsem v SilvestrovÏ skupinÏ. TÏûili jsme nÏkolik dnÌ a pak zaËal b˝t Silvestro z niËeho nic straönÏ nervÛznÌ.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_02");//ÿekl, ûe bysme mÏli ukr˝t rudu na nÏjakÈ bezpeËnÈ mÌsto.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_03");//No, a protoûe jsem se tehdy uû stejnÏ chystal pl·chnout, nabÌdnul jsem se, ûe rudu schov·m.
	AI_Output (self ,other,"DIA_DiegoOw_Mine_11_04");//A to bylo moje jedin˝ ötÏstÌ. HornÌci totiû narazili na p·r d˘lnÌch Ëerv˘. é·dn˝ z nich nep¯eûil.
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
	description = "Pokud jde o ty dva mrtvÈ rytÌ¯e...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Ritter_15_00");//Co ti dva mrtvÌ rytÌ¯i p¯ed tvou skr˝öÌ?
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_01");//Naöla si je zubat· bÏhem bitvy se skupinou chÚapavc˘.
	AI_Output (self ,other,"DIA_DiegoOw_Ritter_11_02");//No, Hornick˝ ˙dolÌ m· svoje vlastnÌ z·kony. ÿÌkal jsem jim to. Ale nechtÏli mÏ poslouchat.
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
	description = "Co bych mÏl o ˙dolÌ vÏdÏt?";
};                       
FUNC INT DIA_DiegoOw_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_DiegoOw_Perm_Info()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Perm_15_00");//Co bych mÏl o ˙dolÌ vÏdÏt?
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_01");//Od p·du bariÈry se tady p·r vÏcÌ zmÏnilo. HlavnÌ slovo tu teÔ majÌ sk¯eti.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_02");//My lidÈ nejsme nic jin˝ho neû ûr·dlo pro skuteËn˝ p·ny ˙dolÌ: draky.
	AI_Output (self ,other,"DIA_DiegoOw_Perm_11_03");//Drû se stranou od vöeho, co je nad tvoje sÌly - a vyh˝bej se vöemu, co vypad· jako drak.
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
	description = "R·d bych Gorna vykoupil z vÏzenÌ...";
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
	AI_Output (other ,self,"DIA_DiegoOw_Gorn_15_00");//ChtÏl bych vykoupit Gornovi na svobodu, ale Garond za to chce 1000 zlat˝ch.
	AI_Output (self ,other,"DIA_DiegoOw_Gorn_11_01");//Hezk· sumiËka. M·m u sebe 300 zlat˝ch, klidnÏ si je vezmi. Ale zbytek je na tobÏ.
	
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
	description = "M˘ûeö mÏ nÏËemu nauËit?";
};                       
func INT DIA_DiegoOw_Teach_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_DiegoOw_Teach_info ()
{	
	AI_Output (other ,self,"DIA_DiegoOw_Teach_15_00");//M˘ûeö mÏ nÏËemu nauËit?
	AI_Output (self, other,"DIA_Addon_DiegoOw_Teach_11_01");//JasnÏ, co bys r·d vÏdÏl?
		
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
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //Trochu obratnosti uû jsi zÌskal.
	};
	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //(odhadnÏ) Dob¯e. Tv· sÌla se zv˝öila.
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

	description	= 	"PojÔme spolu.";
};
func int DIA_Addon_ThiefOW_Together_Condition ()
{
	return TRUE;
};
func void DIA_Addon_ThiefOW_Together_Info ()
{
	AI_Output (other, self,	"DIA_Addon_Diego_Together_15_00"); //Tak pojÔme spolu.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_01"); //Do pr˘smyku? ProË ne.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_02"); //BÏû prvnÌ. Sotva jsi odsud p¯iöel.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_03"); //Ale aù tÏ ani nenapadne se moc p¯ibliûovat k hradu nebo ke sk¯etÌ palis·dÏ.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_04"); //A taky se vyh˝bej opevnÏn˝m t·bor˘m paladin˘.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_05"); //Pr·vÏ jsem z jednoho utekl a rozhodnÏ se nehodl·m d¯Ìt do ˙moru nÏkde v dole.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_06"); //A snad ani nemusÌm zmiÚovat, ûe by ses nemÏl p¯ibliûovat k û·dnÈmu z drak˘.
	AI_Output (self, other, "DIA_Addon_Diego_Together_11_07"); //Dej mi vÏdÏt, aû budeö p¯ipravenej.
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
	description	= 	"PojÔ se mnou.";
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
	AI_Output (other, self, "DIA_Addon_Diego_ComeOn_15_00"); //PojÔ se mnou.
	
	if (C_DiegoTooFar(0))
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_01"); //Tudy ne!

		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Diego_ComeOn_11_02"); //Dob¯e.

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
	description = "PoËkej tady.";
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
	AI_Output (other, self,"DIA_Addon_Diego_WarteHier_15_00"); //PoËkej tady!
		
	if (Npc_GetDistToWP (self, "LOCATION_02_05") < 2000)
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_01"); //Fajn. 
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else if (Npc_GetDistToWP (self, "DT_E1_04") < (1500+1000)) //XARDAS
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_02"); //PoËk·m u tÈ vÏûe venku.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"XARDAS");
	}
	else if (Npc_GetDistToWP (self, "OW_NEWMINE_11") < (4000+1000)) //FAJETHMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_03"); //PoËk·m u dolu.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"FAJETH");
	}
	else if (Npc_GetDistToWP (self, "OW_MINE3_OUT") < (1200+1000)) //SILVESTROMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_04"); //PoËk·m p¯Ìmo p¯ed dolem.
		AI_StopProcessInfos (self); 
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"SILVESTRO");
	}
	else if (Npc_GetDistToWP (self, "OW_PATH_266") < (3000+1000)) //GRIMESMINE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_05"); //PoËk·m tady kousek.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"GRIMES");
	}
	else if (Npc_GetDistToWP (self, "LOCATION_02_05") < 15000) //Orcbarrier FIRE ANGAR LAKE
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_06"); //Ne. Vr·tÌm se zp·tky do jeskynÏ.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_07"); //Aû tu skonËÌö, zajdi za mnou.
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_08"); //Ale moc dlouho neot·lej, nebo se vr·tÌm s·m.
		AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(self,"START");
	}
	else //zu weit weg
	{
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_09"); //DÏl·ö si srandu? To se m·me rozdÏlit? Tady?
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_10"); //Jen p¯es mou mrtvolu!
		AI_Output (self, other, "DIA_Addon_Diego_GoHome_11_11"); //P˘jdeme teÔ do pr˘smyku - spolu.
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_00"); //BÏû prvnÌ a omrkni to tam - j· poËk·m venku.
};
// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_01"); //Do pr˘smyku se jde jinudy!
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_02"); //Na t˝hle hrobce je nÏco straöideln˝ho.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_03"); //Radöi bysme to mÏli obejÌt.
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_04"); //To je vchod do b˝val˝ho Nov˝ho t·bora. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_05"); //UrËitÏ se tam usadil nÏjakej drak.
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
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_06"); //Baûina je slep· uliËka.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_07"); //Nep¯ekvapilo by mÏ, kdyby se v nÌ usÌdlil nÏjakej drak.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_08"); //NechoÔme tam.
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_09"); //Kdyû p˘jdeme po¯·d nahoru, urËitÏ potk·me draka.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_10"); //A j· bych se r·d dostal do Khorinidu éIVEJ.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_11"); //VezmÏme to jinudy.
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_12"); //Tohle jezero n·s nikam nedovede.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_13"); //Do pr˘smyku musÌme jÌt jinudy!
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_14"); //Tohle je star· Xardasova vÏû. Ale pochopitelnÏ ji opustil uû d·vno.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_15"); //UrËitÏ tam narafiËil spoustu nep¯Ìjemnejch p¯ekvapenÌ. 
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_16"); //Tamhle je Fajeth˘v d˘l.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_17"); //Jestli chceö jÌt dovnit¯, tak mÏ vynech!
			Diego_FajethVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_18"); //J· bych se tomu dolu vyh˝bal na sto hon˘!
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_19"); //P¯esnÏ do tohohle dolu mÏ odvlekli i s ostatnÌma trestancema.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_20"); //VÌm urËitÏ, ûe NIKDO nep¯eûil.
			B_Addon_Diego_WillWaitOutside();
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //Ale kdyû ti to potrv· moc dlouho, vr·tÌm se do sv˝ho t·bora.
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //Pokud teda nechceö, abych tu na tebe poËkal.
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
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_21"); //Tohle je jeden z novejch paladinskejch dol˘. 
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_22"); //Nikdy jsem tam nebyl, a ani o to nestojÌm.
			Diego_GrimesVariation = 1;
		}
		else //1
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_23"); //Od tohohle dolu se radöi drûme d·l.
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_24"); //Seö snad sebevrah, nebo co? Od toho hradu se drû hezky daleko!
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{	
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_25"); //Hele, poslouch·ö mÏ v˘bec?! Drû se od toho hradu d·l!
			Diego_BurgVariation = 2;
		}
		else //2
		{
			AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_26"); //Copak nerozumÌö Ëesky? 'Od toho hradu d·l'! Je to tak nepochopiteln˝, nebo co?
			Diego_BurgVariation = 1;
		};	
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_27"); //Tady uû d·l nem˘ûeme. Sk¯etÌ bariÈra je p¯Ìliö nebezpeËn·.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_28"); //MyslÌm, ûe bude lepöÌ, kdyû to teÔ st¯ihneme k z·padu a obejdeme to z druh˝ strany.
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_29"); //Kdybychom pokraËovali tudy, jen bysme zase narazili na sk¯etÌ bariÈru.
		AI_Output (self, other, "DIA_Addon_Diego_TooFar_11_30"); //Vzh˘ru do pr˘smyku!
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{	
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_02"); //D·l uû p˘jdu s·m.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_03"); //JeötÏ si musÌm p·r vÏcÌ za¯Ìdit, neû se vr·tÌm do Khorinidu.
	AI_Output (self, other, "DIA_Addon_Diego_Angekommen_11_04"); //DÌky, kamar·de. UvidÌme se ve mÏstÏ.
	
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
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //Pamatujeö?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //Jak jsme se potkali poprvÈ?
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //Uû je to tak dlouho...
	AI_Output (self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //Ale tady b˝valo nÏco JIN›HO... Hmm, sakra! Uû si to nepamatuju!
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
	description = "Je vöechno v po¯·dku?";
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
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_01"); //Hodil by se mi lÈËivej lektvar, nemÏl bys nÏjakej?
	}
	else if (DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& 		(Diego_angekommen == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Diego_PERM_11_02"); //Tak mi ¯ekni, aû budeö chtÌt vyrazit.
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



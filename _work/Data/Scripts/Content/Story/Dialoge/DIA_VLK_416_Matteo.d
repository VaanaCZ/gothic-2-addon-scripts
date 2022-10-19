// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Matteo_EXIT(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 999;
	condition	= DIA_Matteo_EXIT_Condition;
	information	= DIA_MAtteo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Matteo_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Matteo_PICKPOCKET (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 900;
	condition	= DIA_Matteo_PICKPOCKET_Condition;
	information	= DIA_Matteo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen (80, 150);
};
 
FUNC VOID DIA_Matteo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Matteo_PICKPOCKET);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_BACK 		,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
	
func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Matteo_Hallo(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_Hallo_Condition;
	information	= DIA_MAtteo_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Matteo_Hallo_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Co mogê dla ciebie zrobiæ?
};

// ************************************************************
// 			  				   Sell What 
// ************************************************************
INSTANCE DIA_Matteo_SellWhat(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_SellWhat_Condition;
	information	= DIA_MAtteo_SellWhat_Info;
	permanent	= FALSE;
	description = "Co sprzedajesz?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Co sprzedajesz?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Mogê ci zaproponowaæ wszystko, czego bêdziesz potrzebowaæ, ¿eby przetrwaæ w dziczy. Broñ, pochodnie, ¿ywnoœæ... nawet pancerz.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //Mam na stanie coœ specjalnego.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Pancerz z podwójnie utwardzanej skóry zêbacza - nieu¿ywany. Zainteresowany?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Sklep Mattea znajduje siê przy po³udniowej bramie miasta. Mo¿na tam kupiæ orê¿, ¿ywnoœæ oraz wyposa¿enie.");
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE 				
// *********************************************************
INSTANCE DIA_Matteo_TRADE (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 800;
	condition	= DIA_Matteo_TRADE_Condition;
	information	= DIA_Matteo_TRADE_Info;
	permanent	= TRUE;
	description = "Poka¿ mi swoje towary.";
	Trade		= TRUE;
};                       
FUNC INT DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};	
};

var int Matteo_TradeNewsPermanent;

FUNC VOID DIA_Matteo_TRADE_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Poka¿ mi swoje towary.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Od czasu jak najemnicy za³atwili paladyna Lothara, inspekcje paladynów s¹ coraz bardziej nieprzyjemne.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Mam nadziejê, ¿e jak ju¿ powiesz¹ mordercê, sytuacja siê uspokoi.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Wygl¹da na to, ¿e tym razem paladyni traktuj¹ to naprawdê powa¿nie. Wycofali nawet swoich stra¿ników ze statku.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //Dobrze, ¿e uzupe³niasz zapasy. Kto wie, czy miasto utrzyma siê jeszcze tydzieñ.
	
		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR 				
// *********************************************************

//-------------------------------------
	var int Matteo_LeatherBought;
//-------------------------------------

instance DIA_Matteo_LEATHER		(C_INFO)
{
	npc			 = 	VLK_416_Matteo;
	nr			 =  850;
	condition	 = 	DIA_Matteo_LEATHER_Condition;
	information	 = 	DIA_Matteo_LEATHER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Kup skórzany pancerz. Ochrona: broñ 25, strza³y 20. 250 sztuk z³ota.";
};

func int DIA_Matteo_LEATHER_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Matteo_LEATHER_Info ()
{
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Dobra, daj mi pancerz.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //Na pewno ci siê spodoba.

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //Ten pancerz ma swoj¹ cenê - i jest jej wart. PrzyjdŸ, jak bêdziesz mia³ z³oto.
	};
};

// ************************************************************
// 			  				Paladine 			E1
// ************************************************************
INSTANCE DIA_Matteo_Paladine(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Paladine_Condition;
	information	= DIA_MAtteo_Paladine_Info;
	permanent	= FALSE;
	description = "Co wiesz o paladynach?";
};                       
FUNC INT DIA_Matteo_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Matteo_Paladine_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Co wiesz o paladynach?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Od czasu, jak te bydlaki przysz³y do miasta, mam same k³opoty.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //Kiedy ostatnio szed³em do górnego miasta, zatrzymali mnie stra¿nicy i zapytali, po co tam idê!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //I?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Oczywiœcie, ¿e mnie wpuœcili!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //Mia³em w mieœcie sklep, kiedy wiêkszoœæ z tych nadêtych dupków gania³a jeszcze œwinie!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //A wczoraj te bydlaki skonfiskowa³y po³owê mojego towaru!
};

// ************************************************************
// 			  				Confiscated 			E2
// ************************************************************
INSTANCE DIA_Matteo_Confiscated(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Confiscated_Condition;
	information	= DIA_MAtteo_Confiscated_Info;
	permanent	= FALSE;
	description = "Paladyni zabrali twoje towary?";
};                       
FUNC INT DIA_Matteo_Confiscated_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Confiscated_Info()
{	

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //Paladyni zabrali twoje towary?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //Wszystko, co mia³em na podwórku.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Postawili stra¿nika przy wejœciu na podwórko.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //Jeœli mi siê poszczêœci, nie zabior¹ mi wszystkiego. Mo¿e chocia¿ zostawi¹ tê zbrojê.
};

// ************************************************************
// 			  				HelpMeToOV 			E2
// ************************************************************
INSTANCE DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeToOV_Condition;
	information	= DIA_MAtteo_HelpMeToOV_Info;
	permanent	= FALSE;
	description = "Czy mo¿esz mi pomóc dostaæ siê do górnego miasta?";
};                       
FUNC INT DIA_Matteo_HelpMeToOV_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeToOV_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //Mo¿esz mi pomóc dostaæ siê do górnego miasta?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //Co? Co bêdziesz TAM robi³?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //Mam wa¿n¹ wiadomoœæ...
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //No, no, no. Próbowa³eœ przemkn¹æ siê ko³o stra¿ników?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //Cz³owieku, zapomnij!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //To TYPOWE dla tych ¿ebraków!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Nie rozumiem, dlaczego mia³bym w ogóle próbowaæ.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Pewnie masz racjê.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //Nie wiem, jak WA¯NA jest twoja wiadomoœæ - nie obchodzi mnie to.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Ale nawet gdybyœ powiedzia³ im, ¿e statek pe³en orków wp³yn¹³ w³aœnie do portu i tak by ciê odes³ali.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Bo maj¹ swoje ROZKAZY.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Wygl¹da na to, ¿e to dla ciebie wa¿ne.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //Pytanie tylko, JAK wa¿ne?
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //Do czego zmierzasz?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Mogê ci pomóc - by³o nie by³o jestem tu jednym z najbardziej wp³ywowych ludzi.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Ale to ciê bêdzie kosztowaæ.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "No to jak? Mo¿esz mi pomóc dostaæ siê do górnego miasta?";
};                       
FUNC INT DIA_Matteo_HelpMeNow_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeNow_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //No to jak? Mo¿esz mi pomóc dostaæ siê do górnego miasta?
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
INSTANCE DIA_Matteo_LehrlingLater(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_LehrlingLater_Condition;
	information	= DIA_MAtteo_LehrlingLater_Info;
	permanent	= FALSE;
	description = "Pomó¿ mi zostaæ czeladnikiem u jednego z mistrzów!";
};                       
FUNC INT DIA_Matteo_LehrlingLater_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func VOID DIA_Matteo_LehrlingLater_Info()
{	
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Pomó¿ mi zostaæ czeladnikiem u jednego z mistrzów.
	B_Matteo_Preis();
};
	
// ************************************************************
// 			  		PriceOfHelp  (MISSION)			E4
// ************************************************************
INSTANCE DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_PriceOfHelp_Condition;
	information	= DIA_MAtteo_PriceOfHelp_Info;
	permanent	= FALSE;
	description = "Co chcesz w zamian za pomoc?";
};                       
FUNC INT DIA_Matteo_PriceOfHelp_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_PriceOfHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Co chcesz w zamian za pomoc?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 sztuk z³ota.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "To cholernie du¿o...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Ty pijawko!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //Spokojnie! Nie TWOJE z³oto mia³em na myœli.
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //Ale.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //W³aœciwie, chodzi mi o MOJE z³oto.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Gritta, bratanica stolarza, od dawna jest mi winna pieni¹dze.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //Ta ma³a lisica krêci siê po okolicy w nowych ciuszkach - a to znaczy, ¿e ma pieni¹dze.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //Wywlek³bym jej te pieni¹dze z gard³a, ale Mistrz Thorben - stolarz - to bardzo wp³ywowy cz³owiek.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Za³atw mi te pieni¹dze, to ci pomogê.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Jeœli Matteo dostanie od siostrzenicy stolarza Thorbena, Gritty, 100 sztuk z³ota, które jest mu winna, pomo¿e mi dostaæ siê do górnego miasta.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Ty pijawko!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //To cholernie du¿o...
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoGritta(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_WoGritta_Condition;
	information	= DIA_MAtteo_WoGritta_Info;
	permanent	= FALSE;
	description = "Gdzie znajdê tê Grittê?";
};                       
FUNC INT DIA_Matteo_WoGritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoGritta_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //Gdzie znajdê tê Grittê?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Tak jak powiedzia³em, to siostrzenica stolarza. Jego dom stoi przy tej ulicy. To ostatni budynek po prawej stronie przed kuŸni¹.
};

// ************************************************************
// 			  				GoldRunning 			E5
// ************************************************************
INSTANCE DIA_Matteo_GoldRunning(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 500;
	condition	= DIA_Matteo_GoldRunning_Condition;
	information	= DIA_MAtteo_GoldRunning_Info;
	permanent	= TRUE;
	description = "Oto twoje 100 sztuk z³ota!";
};                       
FUNC INT DIA_Matteo_GoldRunning_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& ( Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_GoldRunning_Info()
{	
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Oto twoje 100 sztuk z³ota!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //Na tym z³ocie jest krew Gritty! Nie kaza³em ci jej zabijaæ!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //Nie chcê mieæ z tym nic wspólnego. Mo¿esz zapomnieæ o naszej umowie. Nigdy wiêcej nie próbuj ze mn¹ rozmawiaæ.
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos	(self);
		return;
	};
	
	// FUNC

	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //I co? Robi³a jakieœ problemy?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Nic, o czym warto wspominaæ.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Œwietnie! Dotrzyma³eœ swojej czêœci umowy.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Chcesz za ni¹ zap³aciæ? Hmmm - wola³bym, ¿ebyœ to z niej wycisn¹³!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Mimo to 100 sztuk z³ota, to ci¹gle 100 sztuk z³ota.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Dotrzyma³eœ swojej czêœci umowy.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //Liczenie nie jest twoj¹ najmocniejsz¹ stron¹, co?
	};
};

// ************************************************************
// 		  				Stimme abgeben		E5 - PERM
// ************************************************************

instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_Zustimmung_Condition;
	information	= DIA_MAtteo_Zustimmung_Info;
	permanent	= TRUE;
	description = "Pomó¿ mi zostaæ czeladnikiem u jednego z mistrzów!";
};          
var int   DIA_Matteo_Zustimmung_perm;          
FUNC INT DIA_Matteo_Zustimmung_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& ( (MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS) )
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Zustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Pomó¿ mi zostaæ czeladnikiem u jednego z mistrzów!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //Nie martw siê. Dotrzymam umowy.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Inni mistrzowie us³ysz¹ o tobie same dobre rzeczy.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Jeœli zechcê zostaæ czeladnikiem, Matteo udzieli mi swojego poparcia.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Nie wszystko na raz. Najpierw wywi¹¿ siê z umowy i przynieœ mi z³oto!
	};
};

// ************************************************************
// 			  				HowCanYouHelp 			E4
// ************************************************************
INSTANCE DIA_Matteo_HowCanYouHelp (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_HowCanYouHelp_Condition;
	information	= DIA_MAtteo_HowCanYouHelp_Info;
	permanent	= FALSE;
	description = "Na czym DOK³ADNIE ma polegaæ twoja pomoc?";
};                       
FUNC INT DIA_Matteo_HowCanYouHelp_Condition()
{	
	if ((Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HowCanYouHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Na czym DOK£ADNIE ma polegaæ twoja pomoc?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //To doœæ proste. Wykorzystam swoje wp³ywy, ¿eby jeden z mistrzów przyj¹³ ciê na czeladnika.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //A wtedy praktycznie rzecz bior¹c, bêdziesz obywatelem miasta i górna jego czêœæ stanie przed tob¹ otworem. Poza tym bêdziesz móg³ coœ zarobiæ.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matteo mo¿e mi pomóc zostaæ czeladnikiem u jednego z mistrzów.");
};	

// ************************************************************
// 			  				WoAlsLehrling 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoAlsLehrling (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_WoAlsLehrling_Condition;
	information	= DIA_MAtteo_WoAlsLehrling_Info;
	permanent	= FALSE;
	description = "Kto w takim razie mo¿e przyj¹æ mnie na czeladnika?";
};                       
FUNC INT DIA_Matteo_WoAlsLehrling_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoAlsLehrling_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //Kto w takim razie mo¿e przyj¹æ mnie na czeladnika?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //Mo¿e to byæ którykolwiek z mistrzów mieszkaj¹cych przy g³ównej ulicy.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //Harad kowal, Bosper ³uczarz, Thorben stolarz albo Constantino alchemik.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Jeden z nich musi ciê przyj¹æ.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Wa¿ne jednak, ¿eby zgodzili siê na to pozostali mistrzowie. W Khorinis panuje taki zwyczaj.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Mogê zostaæ czeladnikiem u ³uczarza Bospera, kowala Harada, stolarza Thorbena lub alchemika Constantina.");
	B_LogEntry (Topic_Lehrling,"Zanim zostanê czeladnikiem, muszê zyskaæ poparcie pozosta³ych mistrzów.");
};
// ************************************************************
// 			  				WieZustimmung 			E6
// ************************************************************
INSTANCE DIA_Matteo_WieZustimmung (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 5;
	condition	= DIA_Matteo_WieZustimmung_Condition;
	information	= DIA_MAtteo_WieZustimmung_Info;
	permanent	= FALSE;
	description = "Jak uzyskam zgodê pozosta³ych mistrzów?";
};                       
FUNC INT DIA_Matteo_WieZustimmung_Condition()
{	
	if ( Npc_KnowsInfo (other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo (other,DIA_Matteo_WarumNichtBeiDir) )
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WieZustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Jak uzyskam zgodê pozosta³ych mistrzów?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Musisz ich do tego przekonaæ. IdŸ z nimi porozmawiaæ.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Wystarczy jednak, ¿ebyœ mia³ przeciw sobie wiêcej ni¿ jednego z nich, a nie bêdziesz mia³ szans! Wiêc lepiej siê zachowuj!
	
	B_LogEntry (Topic_Lehrling,"Aby zyskaæ poparcie pozosta³ych mistrzów, muszê dowieœæ swojej wartoœci.");
};	

// ************************************************************
// 			  				WarumNichtBeiDir 			E5
// ************************************************************
INSTANCE DIA_Matteo_WarumNichtBeiDir (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_WarumNichtBeiDir_Condition;
	information	= DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent	= FALSE;
	description = "A dlaczego TY mnie nie weŸmiesz na czeladnika?";
};                       
FUNC INT DIA_Matteo_WarumNichtBeiDir_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WarumNichtBeiDir_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //A dlaczego TY mnie nie weŸmiesz na czeladnika?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //Ja nie mam nic przeciwko, ale inni mistrzowie nie zgadzaj¹ siê.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Ostatnio przyj¹³em innego czeladnika.
};	

// ************************************************************
// 			  				Andere Möglichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "Czy jest jakiœ inny sposób, ¿eby dostaæ siê do górnego miasta?";
};                       
FUNC INT DIA_Matteo_OtherWay_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_OtherWay_Info()
{	
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //Czy jest jakiœ inny sposób, ¿eby dostaæ siê do górnego miasta?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Mo¿e... dam ci znaæ, jak coœ wymyœlê.
};	

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Matteo_Minenanteil (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_Minenanteil_Condition;
	information	= DIA_MAtteo_Minenanteil_Info;

	description = "Wœród rzeczy na sprzeda¿ zauwa¿y³em udzia³y w kopalni.";
};   
                    
FUNC INT DIA_Matteo_Minenanteil_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Matteo_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Wœród rzeczy na sprzeda¿ zauwa¿y³em udzia³y w kopalni. Od kogo je masz?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //Udzia³y w kopalni? Eeee. Sk¹d siê wziê³y? Nie mam pojêcia, sk¹d je mam. Naprawdê, Panie.
	B_GivePlayerXP (XP_Ambient);
};	






































// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Samuel_EXIT(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 999;
	condition	= DIA_Addon_Samuel_EXIT_Condition;
	information	= DIA_Addon_Samuel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
instance DIA_Addon_Samuel_Hello(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 1;
	condition	= DIA_Addon_Samuel_Hello_Condition;
	information	= DIA_Addon_Samuel_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Samuel_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Samuel_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_00"); //¡, nÏkdo novej!
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_01"); //Co si d·ö? Rum, nebo nÏco silnÏjöÌho?
	
	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 			  				Francis
// ************************************************************
instance DIA_Addon_Samuel_Francis(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 2;
	condition	= DIA_Addon_Samuel_Francis_Condition;
	information	= DIA_Addon_Samuel_Francis_Info;

	description	= "ChtÏl bych si s tebou promluvit o Francisovi.";
};                       
FUNC INT DIA_Addon_Samuel_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Samuel_Francis_Info()
{	
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_00"); //ChtÏl bych si s tebou promluvit o Francisovi.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_01"); //Vo tom r·doby kapit·novi mi ani nemluv! 
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_02"); //Celej den sedÌ na t˝ sv˝ tlust˝ prdeli a hraje si na d˘leûit˝ho.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_03"); //Vöichni bysme r·di vÏdÏli, co si sakra kapit·n myslÌ, kdyû velenÌ svÏ¯il zrovna JEMU!
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_04"); //Co vod toho n·fuky chceö?
};

// ************************************************************
// 			  		In Gregs H¸tte (Versteck)
// ************************************************************
instance DIA_Addon_Samuel_Versteck(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 3;
	condition	= DIA_Addon_Samuel_Versteck_Condition;
	information	= DIA_Addon_Samuel_Versteck_Info;

	description	= "MusÌm se nÏjak dostat do Gregovy chatrËe.";
};                       
FUNC INT DIA_Addon_Samuel_Versteck_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Samuel_Francis))
	&& (Francis_ausgeschissen == FALSE)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Samuel_Versteck_Info()
{	
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_02"); //MusÌm se dostat do Gregovy chatrËe.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_05"); //(potutelnÏ) V·ûnÏ? A proË?
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_01"); //Pot¯ebuju zbroj bandit˘.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_06"); //(smÏje se) Francis tÏ do t˝ boudy NIKDY nepustÌ. S kradenÌm Gregovejch vÏcÌ se rovnou rozluË.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_07"); //Pokud...
	AI_Output (other, self,	"DIA_Addon_Samuel_Francis_15_03"); //Co?
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_08"); //...pokud nem·ö nÏco, co by dovopravdy chtÏl.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_09"); //VÌm, ûe ve vopuötÏn˝m dole v kaÚonu si Francis nÏco schoval.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_10"); //Kdyû jsme spolu drûeli str·û a von si jako dycky hodil ölofÌka, mluvil o tom ze spanÌ.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_11"); //Nem·m tucha, co tam ukryl, ale moûn· je to pro nÏj tak d˘leûit˝, ûe by tÏ za to pustil i do t˝ chajdy.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_12"); //(spokojenÏ) Aû se kapit·n vr·tÌ a zjistÌ, ûe mu nÏco chybÌ, d· to Francisovi po¯·dnÏ seûrat.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"PaliË Samuel se zmÌnil o tajnÈm FrancisovÏ ˙krytu, kter˝ by mÏl b˝t v jednom z dol˘ v kaÚonu. Snad tam najdu nÏco, co mi pom˘ûe dostat se do ch˝öe."); 
};

// ************************************************************
// 			  				Rezepte
// ************************************************************
var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Recipe(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 4;
	condition	= DIA_Addon_Samuel_Recipe_Condition;
	information	= DIA_Addon_Samuel_Recipe_Info;
	permanent	= TRUE;
	description = "M·m pro tebe recept.";
};
func INT DIA_Addon_Samuel_Recipe_Condition()
{
	if ( (Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0) )
	|| ( (Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0) )
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_15_00"); //M·m pro tebe recept!
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_14_01"); //V˝bornÏ, mrknu na to. Co je to za recept?
	
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
	if (Samuel_Knows_LousHammer == FALSE) 
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Lou˘v cloum·k",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if (Samuel_Knows_SchlafHammer == FALSE)
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Lou˘v supercloum·k",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};
func VOID DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
};
func VOID DIA_Addon_Samuel_Recipe_LousHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousHammer_15_00"); //Je od Snafa.
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04"); //Ale to znÌ straönÏ ñ hned to musÌm vyzkouöet!
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};
func VOID DIA_Addon_Samuel_Recipe_LousDoubleHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00"); //OpatrnÏ ñ je to pÏknej zabij·k!
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept2, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04"); //Hezky mÏ dÏsÌö, ale stejnÏ to vyzkouöÌm.
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};

// ************************************************************
// 			  	  				 Grog
// ************************************************************
var int Samuel_Grog_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Grog(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 5;
	condition	= DIA_Addon_Samuel_Grog_Condition;
	information	= DIA_Addon_Samuel_Grog_Info;
	permanent	= TRUE;
	description = "P¯iöel jsem si pro sv˘j p¯ÌdÏl ko¯alky. (10 zlat˝ch)";
};                       
FUNC INT DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Samuel_Grog_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Grog_15_00"); //P¯iöel jsem si pro svojÌ ko¯alku.
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{	
		if (Samuel_Grog_Varianz == 0)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_01"); //Vy ned·te bez ko¯alky ani r·nu, co? Tak tady m·ö.
			Samuel_Grog_Varianz = 1;
		}
		else if (Samuel_Grog_Varianz == 1)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_02"); //Douf·m, ûe se to d· pÌt ñ doöla mi totiû Ëist· voda. Ale trocha slan˝ vody jeötÏ nikoho nezabila, ûe jo?
			Samuel_Grog_Varianz = 2;
		}
		else // (Samuel_Grog_Varianz == 2)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_03"); //M˘ûeö mÌt ko¯alky, kolik chceö!
		};
		
		B_GiveInvItems (self,other,ItFo_Addon_Grog,1);
	}
	else //nicht genug Gold
	{
		AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_04"); //Sice je levnej, ale p¯eci ne ˙plnÏ zadarmo! Nap¯ed si nÏco vydÏlej, hochu.
	};
};

// ************************************************************
// 			  	  				Rum
// ************************************************************
var int Samuel_Rum_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Rum(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 6;
	condition	= DIA_Addon_Samuel_Rum_Condition;
	information	= DIA_Addon_Samuel_Rum_Info;
	permanent	= TRUE;
	description = "Dej mi Ú·k˝ho ruma. (30 zlat˝ch)";
};                       
FUNC INT DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_Rum_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Rum_15_00"); //Dej mi rum!
	
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		if (Samuel_Rum_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_01"); //¡, mate¯sk˝ mlÌko n·mo¯nÌk˘! Tady je!
			Samuel_Rum_Varianz = 1;
		}
		else if (Samuel_Rum_Varianz == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_02"); //Rum bude mÌt moûn· tak trochu rybÌ p¯Ìchuù, protoûe jedin˝, co tady m·me, sou star˝ sudy vod herynk˘. Ale rum je rum. Na zdravÌ!
			Samuel_Rum_Varianz = 2;
		}
		else // (Samuel_Rum_Varianz == 2)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_03"); //Tum·ö.
		};
				
		B_GiveInvItems (self,other,ItFo_Addon_rum,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_04"); //Nem·ö dost zlata, ËoveËe! Tak co t¯eba ko¯alku?
	};		
};

// ************************************************************
// 			  	  			Was St‰rkeres
// ************************************************************
var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Stronger(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 7;
	condition	= DIA_Addon_Samuel_Stronger_Condition;
	information	= DIA_Addon_Samuel_Stronger_Info;
	permanent	= TRUE;
	description = "Chci nÏco silnÏjöÌho!";
};
                       
FUNC INT DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func VOID DIA_Addon_Samuel_Stronger_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_00"); //Chci nÏco silnÏjöÌho!
	
	if (Samuel_Stronger_Varianz == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_01"); //¡, tady je nÏkdo zvÏdavej! J· osobnÏ si na nov˝ recepty potrpÌm.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_02"); //Dobr· ko¯alka musÌ bejt Ëist· a siln· a sp·lit ti krk jako tekutej voheÚ.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_03"); //Ale na tu moc Ëasto nenarazÌö. No, uû moc ûvanÌm ñ d·ö si nÏco k pitÌ?
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_04"); //Tum·ö! M˘j vlastnÌ recept! Chutn·? ÿÌk·m mu 'rychlej herynek'.
		B_GiveInvItems (self,other,ItFo_Addon_Schnellerhering,1);
		B_UseItem (other, ItFo_Addon_Schnellerhering);
		AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_05"); //P˘sobivÈ!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_06"); //(smÏje se) To mi m˘ûeö klidnÏ jeötÏ zopakovat. 
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_07"); //Ty asi nezn·ö û·dnej dobrej recept na ko¯alku, co? Jestli jo, tak mi ho musÌö prozradit.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_08"); //D·ö si jeötÏ?
		Samuel_Stronger_Varianz = 1;
	}
	else // (Samuel_Stronger_Varianz == 1)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_09"); //Tak jak se ten tv˘j dryj·k jmenuje?
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou˘v supercloum·k (60 zlat˝ch)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou˘v cloum·k (30 zlat˝ch)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Rychl˝ herynek (30 zlat˝ch)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
// ------------------------------------------------------------
func void B_Addon_Samuel_NoGold()
{
	AI_Output (self, other, "DIA_Addon_Samuel_NoGold_14_00"); //é·dn˝ prachy, û·dnej chlast!
};
// ------------------------------------------------------------

func VOID DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
};
func VOID DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00"); //Dej mi trochu toho tv˝ho rychl˝ho herynka.
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01"); //Je to pÏknej dryj·k, ale ˙Ëinnej!
		B_GiveInvItems (self, other, ItFo_Addon_SchnellerHering, 1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou˘v supercloum·k (60 zlat˝ch)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou˘v cloum·k (30 zlat˝ch)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Rychl˝ herynek (30 zlat˝ch)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousHammer_15_00"); //Chci Lou˘v cloum·k!
	if (B_GiveInvItems (other, self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01"); //V˝born˝ pitÌ! Aû do dna!
		B_GiveInvItems (self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou˘v supercloum·k (60 zlat˝ch)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou˘v cloum·k (30 zlat˝ch)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Rychl˝ herynek (30 zlat˝ch)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00"); //(bezstarostnÏ) Dej mi dvojitÈho. DvojitÈho cloum·ka.
	if (B_GiveInvItems (other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if (Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01"); //Jen abys toho nelitoval, hochu. Douf·m, ûe to nechceö pro sebe.
		}
		else
		{
			AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02"); //(divoce) Jo! Nic jin˝ho ËlovÏka tak nepovzbudÌ!
		};

		B_GiveInvItems (self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou˘v supercloum·k (60 zlat˝ch)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou˘v cloum·k (30 zlat˝ch)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Rychl˝ herynek (30 zlat˝ch)", DIA_Addon_Samuel_Stronger_SchnellerHering);	
};

// ************************************************************
// 			  				 Trade 
// ************************************************************
instance DIA_Addon_Samuel_Trade(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 8;
	condition	= DIA_Addon_Samuel_Trade_Condition;
	information	= DIA_Addon_Samuel_Trade_Info;
	permanent	= TRUE;
	description	= "Co dalöÌho tu jeötÏ m·ö?";
	Trade		= TRUE;
};                       
FUNC INT DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Samuel_Trade_Info()
{	
	B_GiveTradeInv (self);

	Npc_RemoveInvItems	(self, ItFo_Addon_Grog, Npc_HasItems (self,ItFo_Addon_Grog) );
	CreateInvItems 	(self, ItFo_Addon_Grog, 15);
	
	AI_Output (other,self ,"DIA_Addon_Samuel_Trade_15_00"); //A co tu m·ö d·l?
	AI_Output (self ,other,"DIA_Addon_Samuel_Trade_14_01"); //M˘ûu ti d·t nÏco, co kaûdej pir·t pot¯ebuje k p¯eûitÌ.
};

// ************************************************************
// 			  	Was gibt's neues im Lager	(PERM)
// ************************************************************
instance DIA_Addon_Samuel_News(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 99;
	condition	= DIA_Addon_Samuel_News_Condition;
	information	= DIA_Addon_Samuel_News_Info;
	permanent	= TRUE;
	description	= "Co je v t·bo¯e novÈho?";
};                       
FUNC INT DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_News_15_00"); //Co novÈho v t·bo¯e?
	
	if (Npc_IsDead (Francis))
	|| (Francis_ausgeschissen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_01"); //Francis dostal, co mu pat¯Ì! Ani nevÌö, jakou z toho m·m radost!
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_02"); //Seö spr·vnej chlap ñ tak pojÔ, dej si pan·ka ñ j· to platÌm!
		if (GregIsBack == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Samuel_News_14_03"); //A Greg se koneËnÏ vr·til. Sice p¯iöel vo loÔ, ale aspoÚ to tu v t·bo¯e zase srovn· do latÏ.
		};
	}
	else //Greg noch weg UND Francis lebt noch
	{
		if (!Npc_IsDead (Morgan))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_04"); //Vod t˝ doby, co Greg vodjel, se tu nic moc nedÏje. Morgan a vÏtöina chlap˘ se tu prostÏ jen tak poflakujou a cel˝ dny prochlastaj.
		};
		if (!Npc_IsDead (Henry))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_05"); //Jedinej, kdo to vöecko vodmak·, je Henry. Von a jeho chlapi totiû stavÏj palis·du.
		};
		AI_Output (self ,other,"DIA_Addon_Samuel_News_14_06"); //NejvyööÌ Ëas, aby se vr·til kapit·n Greg a po¯·dnÏ Francise nakopal do prdele.
	};
};

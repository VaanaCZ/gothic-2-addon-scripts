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
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_00"); //Ah, ein neues Gesicht!
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_01"); //Was willst du Rum, - oder was Stärkeres?
	
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

	description	= "Ich will mit dir über Francis reden.";
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
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_00"); //Ich will mit dir über Francis reden.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_01"); //Hör mir bloß auf mit diesem Möchtegern-Käpt'n! 
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_02"); //Er sitzt sich den ganzen Tag den Hintern breit und kommt sich wichtig vor!
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_03"); //Wir würden alle gerne wissen, welcher Teufel den Käpt'n geritten hat, ausgerechnet IHM das Kommando zu übertragen!
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_04"); //Was willst du von dem Schnösel?
};

// ************************************************************
// 			  		In Gregs Hütte (Versteck)
// ************************************************************
instance DIA_Addon_Samuel_Versteck(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 3;
	condition	= DIA_Addon_Samuel_Versteck_Condition;
	information	= DIA_Addon_Samuel_Versteck_Info;

	description	= "Ich muss in Gregs Hütte.";
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
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_02"); //Ich muss in Gregs Hütte.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_05"); //(schlau) So? Und was willst du in der Hütte?
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_01"); //Ich brauche eine Banditenrüstung.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_06"); //(lacht) Francis würde ich NIE freiwillig in die Hütte lassen, damit du ein paar von Gregs Sachen mitgehen lassen kannst.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_07"); //Es sei denn...
	AI_Output (other, self,	"DIA_Addon_Samuel_Francis_15_03"); //Ja?
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_08"); //...du hast was, was er unbedingt haben will.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_09"); //Ich weiß, das Francis in einer verlassenen Mine im Canyon irgendwas versteckt hat.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_10"); //Hab mal mit ihm zusammen Wache geschoben. Er ist wie immer eingepennt und hat im Schlaf davon gefaselt.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_11"); //Ich hab keine Ahnung, was es da verbuddelt hat, aber vielleicht ist es ihm so wichtig, daß er dich dafür in die Hütte läßt...
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_12"); //(freut sich) Wenn der Käpt'n wiederkommt, und ein paar von seinen Sachen fehlen, zieht er Francis das Fell über die Ohren.

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Samuel, der Schnapsbrenner, erwähnt ein geheimes Versteck von Francis in einer der Minen im Canyon. Vielleicht finde ich dort etwas, was mir hilft in die Hütte zu kommen."); 
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
	description = "Ich habe ein Rezept für dich!";
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
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_15_00"); //Ich hab ein Rezept für dich!
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_14_01"); //Oh, lass mal sehen. Was den für ein Rezept?
	
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
	if (Samuel_Knows_LousHammer == FALSE) 
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Lou's Hammer",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if (Samuel_Knows_SchlafHammer == FALSE)
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Lou's Doppelhammer",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};
func VOID DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
};
func VOID DIA_Addon_Samuel_Recipe_LousHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousHammer_15_00"); //Es ist von von Snaf.
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04"); //Das hört sich ja schrecklich an, das muss ich sofort ausprobieren.
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};
func VOID DIA_Addon_Samuel_Recipe_LousDoubleHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00"); //Das ist das absolute Mörderzeug, pass auf!
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept2, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04"); //Du machst mir Angst. Ich glaube ich werde trotzdem einen Versuch starten.
	
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
	description = "Ich will meine Ration Grog abholen! (10 Gold)";
};                       
FUNC INT DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Samuel_Grog_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Grog_15_00"); //Ich will meine Ration Grog abholen.
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{	
		if (Samuel_Grog_Varianz == 0)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_01"); //Ohne Grog macht ihr wohl gar nichts, wie? Richtig so, hier hast du.
			Samuel_Grog_Varianz = 1;
		}
		else if (Samuel_Grog_Varianz == 1)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_02"); //Ich hoffe er ist genießbar. Ich hatte nicht genug Süßwasser. Aber ein bisschen Brackwasser hat noch keinem geschadet, oder?
			Samuel_Grog_Varianz = 2;
		}
		else // (Samuel_Grog_Varianz == 2)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_03"); //Grog kannst du haben, soviel du willst!
		};
		
		B_GiveInvItems (self,other,ItFo_Addon_Grog,1);
	}
	else //nicht genug Gold
	{
		AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_04"); //Ich verkaufe ihn billig, aber VERSCHENKEN werde ich ihn nicht. Besorg' dir erst etwas Gold, Junge!
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
	description = "Gib mir Rum (30 Gold)";
};                       
FUNC INT DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_Rum_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Rum_15_00"); //Gib mir Rum!
	
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		if (Samuel_Rum_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_01"); //Ah! Die Muttermilch eines jeden Seemanns. Hier!
			Samuel_Rum_Varianz = 1;
		}
		else if (Samuel_Rum_Varianz == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_02"); //Der Rum könnte ein bißchen nach Fisch schmecken. Wir haben hier nur alte Heringsfässer. Aber Rum bleibt Rum. Wohl bekomm's!
			Samuel_Rum_Varianz = 2;
		}
		else // (Samuel_Rum_Varianz == 2)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_03"); //Hier hast du!
		};
				
		B_GiveInvItems (self,other,ItFo_Addon_rum,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_04"); //Du hast nicht genug Gold, Junge! Wie wärs mit 'nem Grog?
	};		
};

// ************************************************************
// 			  	  			Was Stärkeres
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
	description = "Ich will was Stärkeres!";
};
                       
FUNC INT DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func VOID DIA_Addon_Samuel_Stronger_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_00"); //Ich will was Stärkeres!
	
	if (Samuel_Stronger_Varianz == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_01"); //Ah, ein Suchender! Ich bin auch immer auf der Suche nach neuen Rezepten!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_02"); //Ein echter Schnaps sollte klar und stark sein. Er muss die Kehle runterfliesen wir flüssiges Feuer.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_03"); //Das findet man verdammt selten. Aber ich rede wieder zu viel. Du willst was trinken!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_04"); //Hier! Mein eigenes Rezept! Wie findest du es? Es heißt 'Schneller Hering'
		B_GiveInvItems (self,other,ItFo_Addon_Schnellerhering,1);
		B_UseItem (other, ItFo_Addon_Schnellerhering);
		AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_05"); //Beeindruckend!
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_06"); //(lacht) Ja, das will ich meinen! 
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_07"); //Du kennst nicht zufällig selber gute Schnapsrezepte? Falls doch, mußt du sie mir unbedingt verraten.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_08"); //Willst du noch einen?
		Samuel_Stronger_Varianz = 1;
	}
	else // (Samuel_Stronger_Varianz == 1)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_09"); //Was darf's sein?
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou's Doppelhammer (60 Gold)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou's Hammer (30 Gold)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Schneller Hering (30 Gold)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
// ------------------------------------------------------------
func void B_Addon_Samuel_NoGold()
{
	AI_Output (self, other, "DIA_Addon_Samuel_NoGold_14_00"); //Ohne Gold nichts zu saufen!
};
// ------------------------------------------------------------

func VOID DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
};
func VOID DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00"); //Gib mir was von dem schnellen Hering.
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01"); //Zeimlich üble Brühe, aber sie wirkt!
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
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou's Doppelhammer (60 Gold)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou's Hammer (30 Gold)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Schneller Hering (30 Gold)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousHammer_15_00"); //Ich will Lous Hammer!
	if (B_GiveInvItems (other, self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01"); //Gutes Zeug! Schütt's dir rein!
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
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou's Doppelhammer (60 Gold)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou's Hammer (30 Gold)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Schneller Hering (30 Gold)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00"); //(lässig) Gib mir 'nen Doppelten. 'nen doppelten Hammer.
	if (B_GiveInvItems (other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if (Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01"); //Mach dich nicht unglücklich Kleiner. Ich hoffe, der ist nicht für dich.
		}
		else
		{
			AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02"); //(wild) Ja! Das weckt die müden Lebensgeister!
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
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou's Doppelhammer (60 Gold)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Lou's Hammer (30 Gold)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Schneller Hering (30 Gold)", DIA_Addon_Samuel_Stronger_SchnellerHering);	
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
	description	= "Was hast du sonst noch?";
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
	
	AI_Output (other,self ,"DIA_Addon_Samuel_Trade_15_00"); //Was hast du sonst noch?
	AI_Output (self ,other,"DIA_Addon_Samuel_Trade_14_01"); //Bei mir gibts's alles, was ein Pirat zum Überleben braucht!
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
	description	= "Was gibt's neues im Lager?";
};                       
FUNC INT DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_News_15_00"); //Was gibt's Neues im Lager?
	
	if (Npc_IsDead (Francis))
	|| (Francis_ausgeschissen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_01"); //Francis hat sein Fett weg! Du glaubst ja gar nicht, wie mich das freut!
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_02"); //Du bist in Ordnung. Komm, wir trinken einen - der geht auf mich!
		if (GregIsBack == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Samuel_News_14_03"); //Und Greg ist endlich zurück. Er hat zwar das Schiff verloren, aber zumindest bringt er wieder Ordnung ins Lager.
		};
	}
	else //Greg noch weg UND Francis lebt noch
	{
		if (!Npc_IsDead (Morgan))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_04"); //Seit Greg weg ist, pasiert hier nicht viel. Morgan und die meisten seiner Jungs lassen sich den ganzen Tag voll laufen.
		};
		if (!Npc_IsDead (Henry))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_05"); //Der einzige, der ein bisschen was macht, ist Henry. er zieht mit seinen Jungs die Palisade hoch.
		};
		AI_Output (self ,other,"DIA_Addon_Samuel_News_14_06"); //Wird Zeit, das Käpt'n Greg wiederkommt und diesem Francis mal ordentlich in den Hintern tritt!
	};
};

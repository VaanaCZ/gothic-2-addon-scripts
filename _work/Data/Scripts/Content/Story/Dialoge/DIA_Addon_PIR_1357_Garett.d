// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Komm bloß nicht auf die Idee, mich zu fragen, ob ich beim Entertrupp mitmache.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Was meinst du, was die anderen Jungs machen, wenn ich weg bin, hm?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //Wenn ich wiederkomme, hab ich nicht EINE volle Kiste mehr in meiner Hütte!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Ich bleibe hier und passe auf unsere Vorräte auf!
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //Sieh an, ein Neues Gesicht! Und keiner von den dreckigen Banditen, will ich doch hoffen!
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Ich bin Garett. Wenn du irgend etwas brauchen solltest, frag zuerst mich.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Ich kann dir fast alles besorgen, Wein, Waffen und vieles, was man sonst so braucht.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Außer Schnaps - wenn du 'nen ordentlichen Schnaps willst, geh zu Samuel.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "Wer ist Samuel?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //Wer ist Samuel?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //Unser Schnapsbrenner. Er hat seine Höhle etwas abseits des Lagers direkt am Strand.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Nicht schwer zu finden, geh einfach Richtung Norden.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Ich kann dir nur raten, dich gut mit Grog einzudecken.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Einige der Jungs hier sind Neuen gegenüber nicht gerade aufgeschlossen, verstehst du?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //Da kann ein ordentlicher Schluck Grog Wunder wirken!

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "Wo bekommst du deine Waren her?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Wo bekommst du deine Waren her?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip bringt immer 'ne Menge aus Khorinis mit, wenn er 'rüberfährt.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Bis vor kurzem hat er einiges davon direkt an die Banditen verkauft.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Aber seit es mit den Banditen Krieg gibt, landet der ganze Kram bei mir.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "Was weißt du über die Banditen?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //Was weißt du über die Banditen?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Dazu frag am besten mal Skip.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Der hat 'nen ganz schönen Tanz mitgemacht mit den Kerlen, das kann ich dir sagen.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg hat angeordnet, alle Banditen, die sich in der Nähe des Lagers blicken lassen, abzumurksen.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "Dein Kapitän Greg. Wie ist der so?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //Dein Kapitän Greg. Wie ist der so?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //Er ist 'n harter Knochen, das kann ich dir sagen.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //Und rafffgierig bis auf's Blut.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Er läßt unseren Schatzmeister Francis immer gerade soviel zahlen, daß es zu keiner Meuterei kommt!
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //Und wenn einer von uns mal was WIRKLICH wertvolles erbeutet, reißt er sich's selber unter'n Nagel.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Ich hatte mal den Kompass von 'ner königlichen Fregatte mitgehen lassen.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //Greg, der Mistkerl, hat ihn mir natürlich abgeknöpft.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Pah! Vermutlich hat er ihn irgendwo verbuddelt, genau wie alle seine anderen Schätze.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "Wo könnte Greg den Kompass vergraben haben?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Wo könnte Greg den Kompass vergraben haben?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Greg, sagte mir mal, dass der Tod über meinem Kompass wacht und hat mich ausgelacht.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Sonst noch was?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //An der südlichen Küste gibt es einen Strand. Er ist nur über den Seeweg zu erreichen.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Greg soll öfter mal dort gewesen sein. Vielleicht findest du da was.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Ich hab mich selber schonmal dort umgesehen, aber die Gegend wimmelt von Monstern.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Wenn du's wirklich wagen willst, vergiß nicht ne Hacke mitzunehmen.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg hat Garret einen wertvollen Kompass abgenommen. Garett vermutet, dass er ihn irgendwo am südlichen Strand verbuddelt hat.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "Hier ist dein Kompass.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Hier ist dein Kompass.
	
	//Patch m.f. - weil Händler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(freut sich) Ja, das ist er. Hätte nicht gedacht, dass ich ihn noch mal wiedersehe.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Danke, Mann!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Dieses Mal wird ihn Greg NICHT wieder in die Finger kriegen...
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Hier, nimm diesen Gürtel dafür. Er ist mein wertvollstes Stück.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Du hast doch diesen Gürtel bei mir gekauft, erinnerst du dich?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //Hast 'ne Menge dafü bezahlt - (hastig) und das war er auch wert. Hier - du sollst dein Gold zurückhaben.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret war sehr zufrieden, dass ich ihm seinen Kompass zurück gebracht habe.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "Was kannst du mir über Francis erzählen?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //°Was kannst du mir über Francis erzählen?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg hat ihm das Kommando übertragen, während er weg ist.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Aber als Käpt'n ist Francis ein Versager!
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Er kriegt Morgan ja noch nicht mal dazu seinen Hintern aus dem Bett zu bewegen.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Henry und seine Jungs sind die einzigen, die hier was tun.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Die anderen machen sich hier einen schönen Tag, statt zu arbeiten.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //Ich kann nur hoffen, dass Greg bald wieder da ist.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //Der wird ihnen allen ordentlich in den Arsch treten.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "Gibt's was Neues?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Gibt's was Neues?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Seit Greg weg ist, passiert hier gar nichts.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Jetzt wo Greg wieder da ist, weht hier ein anderer Wind.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};



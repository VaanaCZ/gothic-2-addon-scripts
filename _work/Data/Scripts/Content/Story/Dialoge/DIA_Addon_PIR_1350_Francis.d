// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Francis_EXIT(C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 999;
	condition	= DIA_Addon_Francis_EXIT_Condition;
	information	= DIA_Addon_Francis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Francis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			In Gregs Hütte rein 
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt Hütte nicht
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_First (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 1;
	condition	= DIA_Addon_Francis_First_Condition;
	information	= DIA_Addon_Francis_First_Info;
	permanent	= FALSE;
	description = "È la tua capanna?";
};                       
FUNC INT DIA_Addon_Francis_First_Condition()
{
	if (Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_First_Info()
{	
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //È la tua capanna?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //No, appartiene a Greg.
	Knows_GregsHut = TRUE;
};
// ------------------------------------------------------------
// 			  			Ich muß da rein!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_LetMeIn (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 2;
	condition	= DIA_Addon_Francis_LetMeIn_Condition;
	information	= DIA_Addon_Francis_LetMeIn_Info;
	permanent	= FALSE;
	description = "Devo entrare nella capanna di Greg.";
};                       
FUNC INT DIA_Addon_Francis_LetMeIn_Condition()
{
	if ( (Npc_KnowsInfo (other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE) )
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_LetMeIn_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //Devo entrare nella capanna di Greg.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //Scordatelo!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Greg non c'è. Ho sbarrato la porta e faccio la guardia per evitare che a qualcuno venga in mente di darsi al saccheggio. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //Perciò sparisci, se non vuoi che te le suoni!
};
// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AboutGreg (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 3;
	condition	= DIA_Addon_Francis_AboutGreg_Condition;
	information	= DIA_Addon_Francis_AboutGreg_Info;
	permanent	= FALSE;
	description = "Greg è il tuo capo?";
};                       
FUNC INT DIA_Addon_Francis_AboutGreg_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AboutGreg_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //Greg è il tuo capo?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //Ora non provare a dirmi che lo conosci!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //Qualsiasi marinaio, anzi, qualsiasi abitante dell'isola conosce il terribile Capitan Greg!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //(altezzoso) E ha affidato a ME il comando!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //Devo fare in modo che questi fannulloni eseguano i suoi ordini!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //A qualcuno potrebbe venire in mente di poter fare i suoi porci comodi ora che il Capitano non c'è.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //Ma avrà una bella sorpresa quando Greg tornerà. 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //Gli racconterò tutto quello che è successo qui in sua assenza.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //Compreso chi ha tentato di entrare nella sua capanna.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Quindi gira al largo, o ti ritroverai in un mare di guai.
};
// ------------------------------------------------------------
// 		  			Gib mir Schlüssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;

INSTANCE DIA_Addon_Francis_Key (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 4;
	condition	= DIA_Addon_Francis_Key_Condition;
	information	= DIA_Addon_Francis_Key_Info;
	permanent	= TRUE;
	description = "Dammi la chiave della capanna di Greg!";
};                       
FUNC INT DIA_Addon_Francis_Key_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Key_Info()
{	
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //Dammi la chiave della capanna di Greg!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //Stai scherzando!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "Ci penserò su…", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "Ti darò 2000 pezzi d'oro!", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "Ti darò 1000 pezzi d'oro!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //Ti darò 1000 pezzi d'oro!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //Temo che non bastino per farmi tradire il mio Capitano.
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //Modera i termini o ti leverò la pelle a scudisciate!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //Ti darò 2000 pezzi d'oro!
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Sarebbe ammutinamento, ragazzo mio.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //(tra sé e sé) Per quanto, riflettendoci...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //Oh beh, da' qua. E non una parola con gli altri!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //Eccoti la chiave!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Ma sbrigati, prima che Greg ritorni. E non una parola con gli altri, intesi?!
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //(ride) Scommetto che non possiedi tanto oro!
	};
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AufsMaul (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_AufsMaul_Condition;
	information	= DIA_Addon_Francis_AufsMaul_Info;
	permanent	= TRUE;
	description = "Bene, vediamo cos’hai.";
};                       
FUNC INT DIA_Addon_Francis_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //Bene, fammi vedere cos'hai, allora.
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //(in tono acuto) Cosa? Sono io il capo, qui! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //Ti insegnerò il rispetto, terricolo!
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_Buch (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_Buch_Condition;
	information	= DIA_Addon_Francis_Buch_Info;
	permanent	= TRUE;
	description = "Ho trovato il tuo deposito...";
};                       
FUNC INT DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems (other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Buch_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //Ho trovato il tuo nascondiglio. Il tuo tesoro e il tuo libro paga. Questo libro è tuo, no?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //Ehm... Io... non l'ho mai visto prima.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //E... ehm... anche SE fosse il mio libro...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //Non penserai davvero di darla a bere ai ragazzi mostrando loro qualche pagina ingiallita, vero?
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //Li hai derubati di tutte le loro azioni.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //Ehm... aspetta un po'...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //(servile) Volevi la chiave della capanna di Greg, vero?
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Ti DARÒ la chiave della capanna di Greg!
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //C'è un sacco di roba preziosa lì dentro...
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //(nervoso) In cambio, tu mi darai il libro e terrai la bocca chiusa, intesi?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //E non fare stupidaggini!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //Eccoti i tuoi 2000 pezzi d'oro!
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //E ne aggiungerò altri 500.
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //Eccoti 500 monete d’oro!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //(con foga) E ora dammi quella cosa...
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_PICKPOCKET_Condition;
	information	= DIA_Francis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe facile sottrargli la chiave)";
};                       
func INT DIA_Francis_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Francis_PICKPOCKET);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_BACK 		,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Francis_PICKPOCKET_DoIt);
};
func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft führt zu NEWS!
	};
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};
func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};


// ************************************************************
// 			  		Wenn von Greg weggeschickt 
// ************************************************************
instance DIA_Francis_Ausgeschissen (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_Ausgeschissen_Condition;
	information	= DIA_Francis_Ausgeschissen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
func INT DIA_Francis_Ausgeschissen_Condition()
{
	if (Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_Ausgeschissen_Info()
{	
	if (!Npc_IsDead(Greg))
	{
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //(furioso) Per colpa tua, dovrò segare tavole finché non resterà più un solo ceppo sull'isola.
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //Lasciami in pace!
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				   EXIT 
// ************************************************************

var int DIEGO_COMING;
// -------------------------

INSTANCE DIA_Gerbrandt_EXIT(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 999;
	condition	= DIA_Gerbrandt_EXIT_Condition;
	information	= DIA_Gerbrandt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gerbrandt_EXIT_Info()
{	
	if (DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc (PC_THIEF_NW);
				
		if ( Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine (DiegoNW,"GERBRANDT");
		};	
		//patch m.f. B_Startotherroutine raus und ersetzt durch Npc_exchange 
		
		Npc_ExchangeRoutine  (self,"NEWLIFE");
		B_StartOtherRoutine (GerbrandtsFrau,"NEWLIFE");
		
		DIEGO_COMING = 2; //Weder TRUE noch False
	};
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerbrandt_PICKPOCKET (C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 900;
	condition	= DIA_Gerbrandt_PICKPOCKET_Condition;
	information	= DIA_Gerbrandt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seinen Geldbeutel zu stehlen)";
};                       

FUNC INT DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	&& (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerbrandt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_BACK 		,DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerbrandt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerbrandt_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Gerbrandt_Hello(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 5;
	condition	= DIA_Gerbrandt_Hello_Condition;
	information	= DIA_Gerbrandt_Hello_Info;
	permanent	= FALSE;
	description = "Was machst du hier?";
};                       

FUNC INT DIA_Gerbrandt_Hello_Condition()
{
	if (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_PAL)
	&& (DIEGO_COMING == FALSE) //nur BEVOR Diego kommt
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_15_00"); //Was machst du hier?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_01"); //Wer bist du denn? Anscheinend bist du neu und hast noch nicht mitbekommen, wie das hier läuft.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_10_02"); //Man nennt mich Gerbrandt. Für dich: Herr Gerbrandt! Verstanden?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Verstanden, Gerbrandt.",DIA_Gerbrandt_Hello_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Ja, Herr Gerbrandt.",DIA_Gerbrandt_Hello_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_No_15_00"); //Verstanden, Gerbrandt.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_01"); //Du reißt ganz schön das Maul auf. Du solltest mir gegenüber ein bisschen mehr Respekt zeigen, sonst bekommst du hier noch ganz gewaltige Probleme.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_02"); //Ich sage hier, wo es lang geht. Wenn wer Ärger macht, bekommt er Ärger mit mir und sollte schleunigst die Stadt verlassen, denn wenn ich mit ihm fertig bin, wird er sich wünschen, mir nie begnet zu sein.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_No_10_03"); //Die meisten der Leute im Hafen arbeiten für mich und wenn du irgendwann mal Arbeit suchst, solltest du zusehen, dass ich dich in guter Erinnerung habe.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_15_00"); //Ja, Herr Gerbrandt.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_01"); //Zumindest verstehst du schnell, wie hier der Hase läuft.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_02"); //Wenn meine Geschäfte mal wieder besser laufen, kann ich so einen kräftigen Burschen wie dich bestimmt gebrauchen.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_03"); //Du würdest einen prima Lagerverwalter abgeben.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_10_04"); //Kannst du lesen?
	
	Info_ClearChoices (DIA_Gerbrandt_Hello);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Nein.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Ich will keinen Job.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice (DIA_Gerbrandt_Hello,"Natürlich.",DIA_Gerbrandt_Hello_Yes_Yes);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_No_15_00"); //Nein.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_01"); //Macht nichts, ein paar Säcke wirst du ja wohl tragen können.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_02"); //Wenn ich mit dir zufrieden bin, bekommst du vielleicht sogar eine Festanstellung. Bei mir gibt es immer was zu tun.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_No_10_03"); //Also, wenn die ersten Schiffe wieder anlegen, erwarte ich dich.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_NoJob ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_NoJob_15_00"); //Ich will keinen Job.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_01"); //Du kommst dir wohl ziemlich schlau vor. Pass mal auf, hier bekommt niemand einen Job, wenn ich es nicht zulasse.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_02"); //Wenn du mir also weiter so dumm kommst, dann kannst du dir einen verwanzten Strohsack zum Schlafen suchen, mehr wirst du dir ohnehin nicht leisten können.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_NoJob_10_03"); //Es wird die Zeit kommen, da wirst du bei mir um einen Job betteln.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

FUNC VOID DIA_Gerbrandt_Hello_Yes_Yes ()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //Natürlich.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //Gut, gut. Geschultes Personal bekommt man selten.
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //Wie siehts mit Referenzen aus?
	AI_Output (other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //Referenzen?
	AI_Output (self ,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //Schon gut. Ich werde mir dein Gesicht merken. Wenn der Handel wieder in Schwung kommt, melde dich bei mir. Vielleicht habe ich dann einen Job für dich.

	Info_ClearChoices (DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

FUNC VOID B_GErbrandt_PissOff ()
{
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_00"); //Was soll das werden, willst du dich über mich lustig machen?
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_01"); //Du und dein Freund Diego haben schon genug Unheil angerichtet.
	AI_Output (self,other,"B_Gerbrandt_PissOff_10_02"); //Lass mich in Ruhe!
	
	//Patch m.f. Wenn diego kommt und er wird gefragt, geht er nicht los, weil losgehen steht in exit info und durch diesen Ai_Stop wird das umgangen
	if (DIEGO_COMING != TRUE) //NICHT, wenn Diego kommt
	{
		AI_StopProcessInfos (self);
	};
};

INSTANCE DIA_Gerbrandt_Perm(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 800;
	condition	= DIA_Gerbrandt_Perm_Condition;
	information	= DIA_Gerbrandt_Perm_Info;
	permanent	= TRUE;
	description	= "Gibt's was Neues?";
};                       

FUNC INT DIA_Gerbrandt_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Gerbrandt_Perm_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_Perm_15_00"); //Gibt's was Neues?
	
	if (Kapitel <= 2)
	{
		if (hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_01"); //Leute wie du haben hier oben nichts zu suchen. Hier wohnt die ehrbare Gesellschaft, keine Streuner und auch keine Ganoven.
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_02"); //Wenn du es schaffen solltest, zu Ansehen und Vermögen zu kommen, bist du hier eventuell auch gerne gesehen.
		}
		else
		{
			AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_03"); //Ich kann nicht klagen, ehrenwerter Herr.
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if (hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL)
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_04"); //Ich kenne so Typen wie dich, du weißt einfach nicht, wo dein Platz ist.
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_05"); //Ich werde mal mit dem Statthalter über die Sicherheitsmaßnahmen für das obere Viertel sprechen.
			}
			else
			{
				AI_Output (self ,other,"DIA_Gerbrandt_Perm_10_06"); //Das geht nur mich was an. Ich habe zu tun!
			};
		}
		else
		{
			B_Gerbrandt_PissOff ();
		};
	};
};

//################################
//##
//##	Kapitel 3
//##
//################################

INSTANCE DIA_Gerbrandt_GreetingsFromDiego(C_INFO)
{
	npc			= VLK_403_Gerbrandt;
	nr			= 10;
	condition	= DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information	= DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent	= FALSE;
	description	= "Ich soll dir schöne Grüße von Diego bestellen.";
};                       

FUNC INT DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	
	if (MIS_DiegosResidence == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_DiegosLetter_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_00"); //Ich soll dir schöne Grüße von Diego bestellen.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01"); //(erschrocken) Was? Wer? Welcher Diego?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_02"); //Und ich soll dir diesen Brief geben.
	
	B_GiveInvItems (other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll ();
	
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03"); //(aufgwühlt) Das kann nicht sein. Nein. Ich bin erledigt.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04"); //(ängstlich) Ist er in der Stadt?
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_05"); //Wer?
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06"); //Diego natürlich!
	AI_Output (other,self ,"DIA_Gerbrandt_GreetingsFromDiego_15_07"); //Ja, ich wollte mich gleich mit ihm hier treffen.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08"); //(verzweifelt, zu sich selbst) Dann ist es aus. Alles ist aus.
	AI_Output (self ,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09"); //Ich hab keine Zeit, ich muss hier weg. Schnell. Wenn er mich hier findet, ist alles aus.
	
	MIS_DiegosResidence = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_DiegosResidence);
	
	DIEGO_COMING = TRUE;
};

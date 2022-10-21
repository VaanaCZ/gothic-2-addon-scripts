


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenOW_EXIT(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 999;
	condition	= DIA_MiltenOW_EXIT_Condition;
	information	= DIA_MiltenOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_MiltenOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  		Hallo
// ************************************************************

INSTANCE DIA_MiltenOW_Hello (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= TRUE;
	condition	= DIA_MiltenOW_Hello_Condition;
	information	= DIA_MiltenOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_MiltenOW_Hello_Condition()
{
		return TRUE;
};
FUNC VOID DIA_MiltenOW_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//Sieh an, wer zurückgekehrt ist! Unser Held aus der Barriere!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Schön dich zu sehen, Milten.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"Kennen wir uns?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //Kannst du dich noch an Gorn, Diego und Lester erinnern?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//Schön, dich zu sehen, Milten. Bist du immer noch hier oder schon wieder?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Schon wieder. Nach dem Fall der Barriere bin ich ins Kloster der Feuermagie gegangen.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Aber als klar war, dass die Paladine herkommen wollten, erwies sich meine Erfahrung und Ortskenntnis als ziemlich nützlich.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Also bin ich kurzerhand mit der heiligen Mission betraut worden, die magische Unterstützung für diese Expedition zu übernehmen.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Klar, kenne ich die Jungs noch. ",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Die Namen sagen mir gar nichts.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//Kennen wir uns?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Du hast wohl eine Menge mitgemacht, was?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Klar kenne ich die Jungs noch.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Die Namen sagen mir gar nichts.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Klar kenne ich die Jungs noch.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//Nun, Gorn und Diego sind nicht weit gekommen. Sie wurden hier im Tal von den Paladinen aufgegriffen.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Lester ist allerdings verschwunden - ich habe keine Ahnung, wo er sich rumtreibt.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//Ich habe Lester getroffen - er ist jetzt bei Xardas.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Wenigstens eine gute Nachricht.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//Nun, ich habe nichts Erfreuliches zu berichten.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Die Namen sagen mir gar nichts.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Du hast tatsächlich viel vergessen, was? Nun, lassen wir Vergangenes ruhen und widmen uns dem Jetzt und Hier.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//Auch wenn es nichts Erfreuliches zu berichten gibt.
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
// ************************************************************
// 		Bericht	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Bericht(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 3;
	condition	= DIA_MiltenOW_Bericht_Condition;
	information	= DIA_MiltenOW_Bericht_Info;
	permanent	= FALSE;
	description = "Was kannst du mir berichten?";
};                       

FUNC INT DIA_MiltenOW_Bericht_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Bericht_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//Was kannst du mir berichten?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//Die Paladine sind mit der Absicht hergekommen, das magische Erz zu holen.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Aber bei den Drachenangriffen und den Orks - ich kann mir nicht vorstellen, dass die Paladine hier mit dem Erz rausmarschieren werden.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//Nein, bei Innos - ich spüre die Anwesenheit von etwas Dunklem ... etwas Bösem, das heranwächst. Das von diesem Tal ausgeht.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Für die Vernichtung des Schläfers haben wir einen hohen Preis gezahlt. Die Zerstörung der Barriere hat auch diesen Ort vernichtet.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Jeder von uns kann froh sein, wenn er das hier überlebt.
};
// ************************************************************
// 		Erz		  
// ************************************************************
INSTANCE DIA_MiltenOW_Erz(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 4;
	condition	= DIA_MiltenOW_Erz_Condition;
	information	= DIA_MiltenOW_Erz_Info;
	permanent	= FALSE;
	description = "Wieviel Erz habt ihr schon auf Lager?";
};                       

FUNC INT DIA_MiltenOW_Erz_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Bericht)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Erz_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Wieviel Erz habt ihr schon auf Lager?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Wieviel Erz ...? Nicht eine Kiste! Seit geraumer Zeit haben wir keinen Kontakt mehr zu den Schürfern.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//Es würde mich nicht wundern, wenn sie alle längst tot sind. Und wir selbst werden von Drachen angegriffen und von Orks belagert!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Diese Expedition ist eine einzige Katastrophe.
	
};
/*	
	Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schläfertempel gegangen bist.
*/
// ************************************************************
// 		Wo sind Gorn und Diego?	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Wo(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Wo_Condition;
	information	= DIA_MiltenOW_Wo_Info;
	permanent	= FALSE;
	description = "Wo sind Gorn und Diego jetzt?";
};                       

FUNC INT DIA_MiltenOW_Wo_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	&& (Knows_Diego == TRUE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Wo_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Wo sind Gorn und Diego jetzt?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Nun, Gorn sitzt hier im Kerker - weil er Widerstand bei seiner Festnahme geleistet hat.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Diego haben sie einem Schürftrupp unterstellt - frag den Paladin Parcival, er hat die Gruppen zusammengestellt.
	
	KnowsAboutGorn = TRUE; 
	SearchForDiego = LOG_RUNNING; 
};
// ************************************************************
// 		Gorn befreien			  
// ************************************************************
INSTANCE DIA_MiltenOW_Gorn(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Gorn_Condition;
	information	= DIA_MiltenOW_Gorn_Info;
	permanent	= FALSE;
	description = "Lass uns Gorn befreien!";
};                       

FUNC INT DIA_MiltenOW_Gorn_Condition()
{	
	if (KnowsAboutGorn == TRUE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Gorn_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//Lass uns Gorn befreien!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//Tja, das Problem bei der Sache ist, dass Gorn ein verurteilter Gefangener ist.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Aber wenn wir Glück haben, lässt Garond sich auf ein Geschäft ein und wir können ihn freikaufen.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Ja, vielleicht ...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Halt mich auf dem Laufenden.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Kommandant Garond hat Gorn einsperren lassen. Vielleicht läßt er sich auf ein Geschäft ein und wir können ihn freikaufen.");
};
// ************************************************************
// 		Garond will tausend Goldstücke			  
// ************************************************************
INSTANCE DIA_MiltenOW_Preis(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Preis_Condition;
	information	= DIA_MiltenOW_Preis_Info;
	permanent	= FALSE;
	description = "Garond verlangt 1000 Goldstücke für Gorn.";
};                       

FUNC INT DIA_MiltenOW_Preis_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Preis_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond verlangt 1000 Goldstücke für Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Eine hübsche Summe. Ich kann 250 Goldstücke beisteuern.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten hat mir 250 Goldstücke für die Befreiung von Gorn gegeben.");

};
// ************************************************************
// 		Nicht genug Gold  
// ************************************************************
INSTANCE DIA_MiltenOW_Mehr(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Mehr_Condition;
	information	= DIA_MiltenOW_Mehr_Info;
	permanent	= FALSE;
	description = "Ich brauche mehr Gold, um Gorn freizukaufen.";
};                       

FUNC INT DIA_MiltenOW_Mehr_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Npc_HasItems (other, ItMi_Gold) < 1000) 
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Preis) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Mehr_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//Ich brauche mehr Gold, um Gorn freizukaufen.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//Gold auftreiben ... hm. Mit so was kennt sich Diego aus - aber der ist nicht hier.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Vielleicht hat Gorn selbst noch irgendwo Gold versteckt - das sollten wir herausfinden.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Ich werde ihm eine Notiz schreiben - hier, versuch, sie in den Kerker zu schmuggeln.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten hat mir eine Nachricht für Gorn mitgegeben. Wenn ich sie in den Knast schmuggeln kann, kann er uns vielleicht mitteilen, ob er noch irgendwo Gold versteckt hat.");
};
// ************************************************************
// 		Ausrüstung				  
// ************************************************************
INSTANCE DIA_MiltenOW_Equipment(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Equipment_Condition;
	information	= DIA_MiltenOW_Equipment_Info;
	permanent	= FALSE;
	description = "Kannst du mir Ausrüstung mitgeben?";
};                       

FUNC INT DIA_MiltenOW_Equipment_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Garond_Equipment)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Equipment_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Kannst du mir Ausrüstung mitgeben? Garond hat mich beauftragt, die Schürfstellen aufzusuchen.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//Woher soll ich die nehmen? Das einzige was ich dir geben kann, ist ein wertvoller Runenstein.
	//AI_Output (self ,other,"DIA_MiltenOW_Equipmentt_03_02");//Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schlösser nicht öffnen.  
	
	B_GiveInvItems (self,other, ItMI_RuneBlank,1);
	//Schlüssel auf FP inserten
};	

//***********************
//	Gorns Versteck
//***********************

INSTANCE DIA_MiltenOW_Versteck (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 1;
	condition	= DIA_MiltenOW_Versteck_Condition;
	information	= DIA_MiltenOW_Versteck_Info;
	permanent	= FALSE;
	IMPORTANT 	= FALSE;
	description = "Ich habe Antwort von Gorn... "; 
}; 

FUNC INT DIA_MiltenOW_Versteck_Condition()
{
	if (GornsTreasure == TRUE)
	&& (Npc_HasItems (other, ItMi_GornsTreasure_MIS ) <= 0)
	&& (Gorns_Beutel == FALSE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenOW_Versteck_Info()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //Ich habe Antwort von Gorn, er sagt, das Gold sei am Südtor.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //(bitter) Ehemaliges Südtor wolltest du sagen. Der Drache hat alles in Schutt und Asche gelegt.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Wie komme ich dahin?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //Das ist nahe der Orkramme. Rechts davon war das Südtor.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //Es wird nicht leicht werden - also halt den Kopf unten und beeil dich.
	
	B_LogEntry (TOPIC_RescueGorn,"Rechts neben der Orkramme ist das ehemalige Südtor. Dort liegt irgendwo Gorn's Gold.");
};
// ************************************************************
// 		Gorn ist frei		  
// ************************************************************
INSTANCE DIA_MiltenOW_Frei(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Frei_Condition;
	information	= DIA_MiltenOW_Frei_Info;
	permanent	= FALSE;
	description = "Ich habe Gorn befreit";
};                       

FUNC INT DIA_MiltenOW_Frei_Condition()
{	
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Frei_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//Ich habe Gorn befreit.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Gut. Dann sollten wir überlegen, wie es weiter geht.
};
// ************************************************************
// 		Lehren
// ************************************************************
INSTANCE DIA_MiltenOW_Lehren(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 9;
	condition	= DIA_MiltenOW_Lehren_Condition;
	information	= DIA_MiltenOW_Lehren_Info;
	permanent	= FALSE;
	description = "Kannst du mir was beibringen?";
};                       

FUNC INT DIA_MiltenOW_Lehren_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Lehren_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//Kannst du mir was beibringen?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Ich kann dich in einige Zauber aus dem zweiten Kreis der Magie einweihen oder ich kann dir helfen, deine magische Kraft zu steigern.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Wenn du die Bereitschaft verspürst, deine Macht zu mehren, dann werde ich dich unterweisen.
};	

// ************************************************************
// 		Teach zweiter Kreis
// ************************************************************
INSTANCE DIA_MiltenOW_TeachCircle2(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 91;
	condition	= DIA_MiltenOW_TeachCircle2_Condition;
	information	= DIA_MiltenOW_TeachCircle2_Info;
	permanent	= TRUE;
	description = "Lehre mich den zweiten Kreis der Magie!";
};                       

FUNC INT DIA_MiltenOW_TeachCircle2_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_MiltenOW_Lehren))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_TeachCircle2_Info()
{	
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //Lehre mich den zweiten Kreis der Magie!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //Normalerweise ist das den Lehrern unseres Ordens vorbehalten.
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //Aber ich denke, in diesem Fall können wir mal 'ne Ausnahme machen...
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //Ich weiß nicht, ob ich die offiziellen Worte noch weiß...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Tritt nun in den zweiten Kreis. Äh... Er zeigt dir die Richtung - doch deine Taten formen den Weg - oder so...
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //Ich denke, du hast verstanden, worum es geht...
	};
};


// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenOW_Teach(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 90;
	condition	= DIA_MiltenOW_Teach_Condition;
	information	= DIA_MiltenOW_Teach_Info;
	permanent	= TRUE;
	description = "Ich will neue Zauber lernen.";
};                       

FUNC INT DIA_MiltenOW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Ich will neue Zauber lernen.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenOW_Teach);
		Info_AddChoice (DIA_MiltenOW_Teach,DIALOG_BACK,DIA_MiltenOW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenOW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenOW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenOW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Du hast noch nicht den zweiten Kreis der Magie erreicht. Ich kann dir nichts beibringen.
	};
};	
FUNC VOID DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_Teach);
};
FUNC VOID DIA_MiltenOW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenOW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_OW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenOW_Mana_Condition;
	information	 = 	DIA_MiltenOW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will meine magischen Kräfte steigern.";
};
func int DIA_MiltenOW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_MiltenOW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Ich will meine magischen Kräfte steigern.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Deine magische Kraft ist groß. Zu groß, als dass ich dir jetzt noch helfen könnte, sie zu steigern.
	};
	Info_ClearChoices (DIA_MiltenOW_Mana);
};
func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
	
};
func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
// ************************************************************
// 		Perm
// ************************************************************
INSTANCE DIA_MiltenOW_Perm(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Perm_Condition;
	information	= DIA_MiltenOW_Perm_Info;
	permanent	= TRUE;
	description = "Was ist deine Aufgabe hier?";
};                       
FUNC INT DIA_MiltenOW_Perm_Condition()
{	
	if (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_MiltenOW_Frei) == FALSE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Was ist deine Aufgabe hier?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//Ursprünglich sollte ich das Erz untersuchen. Aber davon haben wir bisher nicht viel gesehen.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Jetzt widme ich mich dem Studium der Alchemie.
};
// ************************************************************
// 		Perm 2
// ************************************************************
INSTANCE DIA_MiltenOW_Plan(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Plan_Condition;
	information	= DIA_MiltenOW_Plan_Info;
	permanent	= TRUE;
	description = "Was sind deine Pläne?";
};                       
FUNC INT DIA_MiltenOW_Plan_Condition()
{	
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Frei) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Plan_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Was sind deine Pläne?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Ich werde wieder zurückkehren. Ich warte noch eine Weile ab, aber da Gorn nun frei ist, kann ich mich zusammen mit ihm absetzen.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Es ist mehr als nötig, dass Pyrokar von der Situation hier erfährt.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Wie du meinst.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Ich hoffe, dass Lord Hagen erkennen wird, welche Bedrohung von diesem Tal ausgeht. Nicht auszudenken, was passiert, wenn die Orks über den Pass kommen.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//Na dann, gute Reise.
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MiltenOW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 888;
	condition	= DIA_MiltenOW_PICKPOCKET_Condition;
	information	= DIA_MiltenOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre schwierig seinen Trank zu stehlen)";
};                       

FUNC INT DIA_MiltenOW_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_MiltenOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MiltenOW_PICKPOCKET);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_BACK 		,DIA_MiltenOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MiltenOW_PICKPOCKET_DoIt);
};

func void DIA_MiltenOW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItPo_Perm_Mana,1);
		B_GiveInvItems (self, other, ItPo_Perm_Mana, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_MiltenOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
};




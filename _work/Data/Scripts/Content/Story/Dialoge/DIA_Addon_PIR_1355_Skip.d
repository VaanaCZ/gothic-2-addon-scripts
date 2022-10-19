// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //Sieh mal einer an, wer dem alten Skip hier über den Weg läuft.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //(übertrieben) Ich kenne dich!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //Die Bucht in der Nähe der Stadt, erinnerst du dich?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip! Richtig?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(stolz) Ich sehe, ich habe einen bleibenden Eindruck hinterlassen.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Aber ich habe deine Visage zwischendurch NOCH irgendwo gesehen...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //Ah! Sicher!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //Naja. Schlecht getroffen, aber du BIST es.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Mach dir nichts draus. Mein Steckbrief sieht genau so dämlich aus.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "Ich habe ein Paket von Baltram für dich.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //Ich habe ein Paket von Baltram für dich.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(grinst) Der Typ muß ganz schön scharf sein auf unseren Rum, wenn er seine Ware bis HIERHIN hinterherschippern läßt.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Hier, gib ihm die 2 Flaschen Rum. Die dritte habe ich gesoffen, als ich auf ihn gewartet habe.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Was machst du hier?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Was machst du hier?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Ich bin gerade aus Khorinis zurück und jetzt warte ich darauf, dass Greg wiederkommt.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "Ich hab Greg in Khorinis gesehen.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //Ich hab Greg in Khorinis gesehen.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Wirklich? Verdammt! Dann muß was schiefgelaufen sein.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Er sollte eigentlich längst mit unserem Schiff hier sein.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //(nachdenklich) Es wird wohl das Beste sein, wenn ich nach Khorinis zurückfahre und dort auf ihn warte...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(seufzt) Aber heute bestimmt nicht mehr. Ich bin ja gerade erst hier angekommen.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Kannst du mich nach Khorinis bringen?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Kannst du mich nach Khorinis bringen?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Nee. Ich fahre später. Werd' mir erstmal 'nen ordentlichen Schluck Grog genehmigen.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Bist du verrückt? Wir haben unser SCHIFF verloren, Mann!
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Mit unserem letzten Boot werd ich keine Spazierfahrt machen, nur weil du zu faul bist, deinen Hintern SELBER nach Khorinis zu schwingen!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Wie oft noch? Nein!
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Was kannst du mir über die Banditen erzählen?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Was kannst du mir über die Banditen erzählen?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //Die Banditen?! Sie greifen uns AN!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Was meinst du, warum wir die Palisade bauen?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //Wir haben die Drecksäcke selber hier rübergeschippert.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //Haben mit ihnen gehandelt. Junge, ich sag dir die haben soviel Gold, daß es ihnen aus den Ohren wieder rauskommt!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Sie waren bereit, jeden Preis für ein Fass Rum zu bezahlen.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Aber die Zeiten sind vorbei. Jetzt ist Krieg!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Was ist passiert?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Die Mistkerle hatten ihre letzte Lieferung nicht bezahlt.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //Also bin ich hin und wollte sehen, wo unser Gold bleibt.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Aber als ich in den Sumpf kam, griffen die Schweine mich an!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //Und das ist noch nicht alles. Sie haben Angus und Hank umgelegt! Zwei von unseren besten Jungs!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Geh bloß nicht in den Sumpf, sag ich dir!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Die greifen alles an, was nicht so zerlumpt rumläuft wie sie.
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Ich brauche eine Banditenrüstung!";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Ich brauche eine Banditenrüstung.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Du willst da reingehen? Bist du Wahnsinnig? 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Wenn die Typen rausfinden, daß du nicht zu ihnen gehörst, machen die Hackfleich aus dir!
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Hast du eine Ahnung, wo ich so eine Rüstung finden kann?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(seufzt) Du läßt nicht locker, was? Also gut. Wir hatten mal eine hier.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Greg hat sie sicher noch irgendwo oben in seiner Hütte.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Wenn er wieder da ist, kannst du sie ihm vielleicht abkaufen...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip vermutet die Rüstung in Gregs Hütte."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "Hast du eine Ahnung, wie ich in Gregs Hütte komme?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //Hast du eine Ahnung, wie ich in die Hütte komme?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Hauahah! Immer langsam!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Du willst dich doch nicht einfach so an Gregs Krempel vergreifen?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Als er abfuhr, hat er Francis den Schlüssel gegeben, und ihm befohlen, NIEMANDEN in seine Hütte zu lassen.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis hat den Schlüssel zu Gregs Hütte. Er hat den Befehl niemanden hereinzulassen."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Was kannst du mir über Francis erzählen?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Was kannst du mir über Francis erzählen?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //Francis ist unser Schatzmeister.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Der Käpt'n vertraut ihm. Deswegen hat er ihm auch wohl das Kommando übergeben.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Obwohl ihn keiner von den Jungs hier wirklich ernst nimmt.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Wenn du mehr wissen willst, rede mit Samuel.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Er hat in der kleinen Höhle nördlich von hier seine Schnapsbrennerei.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //Es gibt niemanden hier im Lager, über den Samuel NICHT 'ne Menge weiß...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Ich sollte mich mal mit Samuel unterhalten. Vielleicht kann er mir weiterhelfen."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Bist du Raven schon mal begegnet?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Bist du Raven schon mal begegnet?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Allerdings. Ich war bei Henry, vorne am Tor. Da hab' ich gesehen, wie Raven einige von seinen Jungs bei dem Turm im Süden postiert hat.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Ganz in der Nähe des Lagers. (lacht) Ich schätze, die sollen uns ausspionieren.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //Ich hab auch gesehen, wie er seine Leute behandelt, wenn sie nicht tun, was er will.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //Jeder, der ihm nicht auf's Wort gehorcht, bringt er er eiskalt um.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Vor Raven musst du dich in Acht nehmen, sag ich dir.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Erzähl mir mehr über Angus und Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Erzähl mir mehr über Angus und Hank.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus und Hank sollten sich mit ein paar von den Banditen vorm Lager treffen.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Sie hatten jede Menge Krempel dabei. Alles, was die Mistkerle bei uns bestellt hatten.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Schmiedestahl und Dietriche und so'n Zeug. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Aber sie kamen nie zurück. Diese Banditenschweine haben sie mit Sicherheit um die Ecke gebracht!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan und Bill haben die beiden gesucht - ohne Erfolg.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill war ziemlich fertig wegen der Sache. Er war mit den beiden befreundet.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Er ist noch jung, ihn nimmt sowas noch richtig mit.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //Wir anderen haben's mit Fassung getragen. Die Waren sind ja noch zu verschmerzen. (seufzt) Aber der Grog, den sie dabei hatten...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(sauer) Das waren mindestens 20 Flaschen!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip hat anscheinen 20 Flaschen Grog an die Banditen verloren. Er will sie zurück.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus und Hank sollten sich mit eine paar Banditen treffen um zu handeln. Sie wurden nie wieder gesehen.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Die Suche von Morgan und Bill blieb erfolglos.");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "Wegen Angus und Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //Wegen Angus und Hank...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Was?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Ich habe sie gefunden.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Sie sind tot.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //(zu sich) Mausetot - die armen Teufel!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //Tja, hatte ich auch nicht anders erwartet.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Du solltest die Sache Bill erzählen, falls du's nicht schon getan hast.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Aber bring's ihm schonend bei - er ist noch jung.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "Ich kenne den Mörder von Angus und Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //Ich kenne den Mörder von Angus und Hank.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //Schön für dich. Die beiden sind tot. Wen interessiert sowas dann noch?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //Rache hat noch keinen Piraten Reich gemacht.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Hauptsache ich hab meinen Grog wieder.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Der Mörder interessiert mich nicht! Was ist mit meinem Grog?!
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "Wegen des Grogs...";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //Wegen des Grogs ...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Hier hast du deine 20 Flaschen", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Dir fehlen 20 Flaschen, sagst du?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Ja, verdammt. Das war mein gesamter Vorrat.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Hier hast du deine 20 Flaschen.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip hat seine 20 Flaschen Grog wieder und ist glücklich.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Was denn? Umsonst?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //Naja ...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //Ok. Ich werde sie dir bezahlen.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Hast du vielleicht irgendwas Interessanteres als Gold?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Mmh. Mal sehen. Ich habe hier so einen Ring.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //Hab ich vor Jahren in einer stickigen Hafenkneipe beim Glückspiel gewonnen.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //Der Kerl sagte damals, er sei magisch. Keine Ahnung, ob das stimmt.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Vielleicht willst du ihn statt dem Geld?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Gib mir das Geld.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Gib mir den Ring.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Gib mir den Ring.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Hier hast du ihn.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Gib mir das Geld.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //In Ordnung.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Hast du was zu verkaufen?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Hast du was zu verkaufen?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Wenn du handeln willst, geh zu Garrett. Der kümmert sich um unsere Lagerbestände.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Du sollst mir helfen.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Du sollst mir helfen.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //Worum geht's?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //Der Canyon wartet.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Ich sehe, du hast schon ein paar Jungs mit. Das ist gut! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Nimm bloß noch ein paar Jungs mit!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Der Canyon ist mordsgefährlich!
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Komm mit.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Komm mit.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Warte. Lass uns erstmal in den Canyon zurückgehen...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //Auf geht's!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Ich brauch dich nicht mehr.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Ich brauch dich nicht mehr.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //Tja, das war's dann. Ich bin im Lager.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //Das ist weit genug!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Wenn du unbedingt weitergehen willst, dann ohne uns!
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Wenn du unbedingt weitergehen willst, dann ohne mich.
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Wenn wir uns verlieren sollten, treffen wir und hier am Wasserloch wieder.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Lass uns weitergehen!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Orks! Ich hasse die Biester!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Sieht so aus, als wenn wir alle Razor erwischt hätten.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Wir können noch ein bißchen durch die Gegend ziehen, wenn du willst.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Hauptsache, wir bleiben im Canyon. 
	
	AI_StopProcessInfos (self); 
};



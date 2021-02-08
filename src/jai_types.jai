/*
@Note All lines which are declarations and which end in a comment will be parsed as a
	  search/replace. For example, the first line below will be used when creating wrapper
	  functions to replace all instances of `CGameID` with `Game_ID`
*/


Game_ID :: u64;  // CGameID
Steam_ID :: u64; // CSteamID

Warning_Message_Hook :: SteamAPIWarningMessageHook_t; // SteamAPIWarningMessageHook_t

Game_ID_Type :: enum { // EGameIDType
    App        :: 0;
    GameMod    :: 1;
    Shortcut   :: 2;
    P2P        :: 3;
}

Valve_Packing_Sentinel :: struct { // ValvePackingSentinel_t
    m_u32 : u32;
    m_u64 : u64;
    m_u16 : u16;
    m_d : float64;
}

Networking_Custom_Signaling_Recv_Context :: *void; // ISteamNetworkingCustomSignalingRecvContext
Networking_Connection_Custom_Signaling :: *void; // ISteamNetworkingConnectionCustomSignaling

E_Type :: enum { // EType
    String;
    Int; // For most small integral values.  Uses google protobuf sint64, so it's small on the wire.  WARNING: In some places this value may be transmitted in JSON, in which case precision may be lost in backend analytics.  Don't use this for an "identifier", use it for a scalar quantity.
    Fixed64; // 64 arbitrary bits.  This value is treated as an "identifier".  In places where JSON format is used, it will be serialized as a string.  No aggregation / analytics can be performed on this value.
}

Extra_Field :: struct { // ExtraField
    eType : s32; /* EType */
    szName : [28] u8;

    union {
        szStringValue : [128] u8;
        nIntValue : s64;
        nFixed64Value : u64;
    }
}

Datagram_Relay_Auth_Ticket :: struct { // SteamDatagramRelayAuthTicket
	/// Identity of the gameserver we want to talk to.  This is required.
	identityGameserver : SteamNetworkingIdentity;

	/// Identity of the person who was authorized.  This is required.
	identityAuthorizedClient : SteamNetworkingIdentity;

	/// SteamID is authorized to send from a particular public IP.  If this
	/// is 0, then the sender is not restricted to a particular IP.
	///
	/// Recommend to leave this set to zero.
	unPublicIP : uint32;

	/// Time when the ticket expires.  Recommended: take the current
	/// time and add 6 hours, or maybe a bit longer if your gameplay
	/// sessions are longer.
	///
	/// NOTE: relays may reject tickets with expiry times excessively
	/// far in the future, so contact us if you wish to use an expiry
	/// longer than, say, 24 hours.
	rtimeTicketExpiry : RTime32;

	/// Routing information where the gameserver is listening for
	/// relayed traffic.  You should fill this in when generating
	/// a ticket.
	///
	/// When generating tickets on your backend:
	/// - In production: The gameserver knows the proper routing
	///   information, so you need to call
	///   ISteamNetworkingSockets::GetHostedDedicatedServerAddress
	///   and send the info to your backend.
	/// - In development, you will need to provide public IP
	///   of the server using SteamDatagramServiceNetID::SetDevAddress.
	///   Relays need to be able to send UDP
	///   packets to this server.  Since it's very likely that
	///   your server is behind a firewall/NAT, make sure that
	///   the address is the one that the outside world can use.
	///   The traffic from the relays will be "unsolicited", so
	///   stateful firewalls won't work -- you will probably have
	///   to set up an explicit port forward.
	/// On the client:
	/// - this field will always be blank.
	routing : SteamDatagramHostedAddress;

	/// App ID this is for.  This is required, and should be the
	/// App ID the client is running.  (Even if your gameserver
	/// uses a different App ID.)
	nAppID : uint32;

	/// Restrict this ticket to be used for a particular virtual port?
	/// Set to -1 to allow any virtual port.
	///
	/// This is useful as a security measure, and also so the client will
	/// use the right ticket (which might have extra fields that are useful
	/// for proper analytics), if the client happens to have more than one
	/// appropriate ticket.
	///
	/// Note: if a client has more that one acceptable ticket, they will
	/// always use the one expiring the latest.
	nRestrictToVirtualPort : s32;

	//
	// Extra fields.
	//
	// These are collected for backend analytics.  For example, you might
	// send a MatchID so that all of the records for a particular match can
	// be located.  Or send a game mode field so that you can compare
	// the network characteristics of different game modes.
	//
	// (At the time of this writing we don't have a way to expose the data
	// we collect to partners, but we hope to in the future so that you can
	// get visibility into network conditions.)
	//


	nExtraFields : s32;
	vecExtraFields : [16] ExtraField;
}

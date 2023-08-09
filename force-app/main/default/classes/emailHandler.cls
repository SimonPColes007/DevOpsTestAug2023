global class emailHandler implements Messaging.InboundEmailHandler {
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          return result;
      }

      // This is great
      List<account> a = new List<account>([Select Id from Account]);

      // So is this.
  }